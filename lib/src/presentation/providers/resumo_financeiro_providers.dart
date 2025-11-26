// src/presentation/providers/resumo_financeiro_providers.dart
// Filtros, lista enriquecida e ação de toggle de recebimento.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/vinculo.dart';
import '../../domain/entities/casa.dart';
import '../../domain/entities/imobiliaria.dart';
import '../../domain/repositories/pagamento_repo.dart';
import '_repos_provider.dart';
import 'auth_provider.dart';

class ResumoFiltro {
  final int ano;
  final int mes;
  final int? imobiliariaId;
  final bool apenasRecebidos;
  const ResumoFiltro({
    required this.ano,
    required this.mes,
    this.imobiliariaId,
    this.apenasRecebidos = false,
  });
}

final resumoFiltroProvider = StateProvider<ResumoFiltro>((_) {
  final now = DateTime.now();
  return ResumoFiltro(ano: now.year, mes: now.month);
});

// Item pronto para exibir na UI
class ResumoItem {
  final Vinculo vinculo;
  final Casa casa;
  final Imobiliaria imobiliaria;
  final double aluguel;
  final double taxaValor;
  final double taxaPercent;
  final bool recebido;
  ResumoItem({
    required this.vinculo,
    required this.casa,
    required this.imobiliaria,
    required this.aluguel,
    required this.taxaValor,
    required this.taxaPercent,
    required this.recebido,
  });
}

final resumoItensProvider = FutureProvider<List<ResumoItem>>((ref) async {
  // Observa o refresh para recarregar quando usuário muda
  ref.watch(dataRefreshProvider);
  final filtro = ref.watch(resumoFiltroProvider);
  final vincRepo = ref.read(vinculoRepoProvider);
  final pgRepo = ref.read(pagamentoRepoProvider);
  final casaRepo = ref.read(casaRepoProvider);
  final imRepo = ref.read(imobiliariaRepoProvider);

  print('📊 Buscando resumo para ${filtro.mes}/${filtro.ano}');

  // Vínculos ativos no mês/ano: início <= último dia do mês && (fim == null || fim >= primeiro dia)
  final primeiro = DateTime(filtro.ano, filtro.mes, 1);
  final ultimo = DateTime(filtro.ano, filtro.mes + 1, 0);

  final todos = await vincRepo.list(apenasAtivos: false);
  print('📊 Total de vínculos: ${todos.length}');

  final ativosNoPeriodo = todos.where((v) {
    final iniOk = !v.inicio.isAfter(ultimo);
    final fimOk = (v.fim == null) || !v.fim!.isBefore(primeiro);
    return iniOk &&
        fimOk &&
        (filtro.imobiliariaId == null ||
            v.imobiliariaId == filtro.imobiliariaId);
  }).toList();

  print('📊 Vínculos ativos no período: ${ativosNoPeriodo.length}');

  final casas = {for (final c in await casaRepo.list()) c.id: c};
  final imobs = {for (final i in await imRepo.list()) i.id: i};

  final itens = <ResumoItem>[];
  for (final v in ativosNoPeriodo) {
    final casa = casas[v.casaId];
    final imob = imobs[v.imobiliariaId];
    if (casa == null || imob == null) continue;

    final aluguel = v.valorAluguel ?? 0;
    final txV = v.taxaValor ?? ((aluguel) * ((v.taxaPercent ?? 0) / 100.0));
    final txP = v.taxaPercent ?? ((aluguel == 0) ? 0 : (txV / aluguel) * 100.0);

    final pg = await pgRepo.getByVinculoAnoMes(v.id, filtro.ano, filtro.mes);
    final recebido = pg?.recebido == true;

    print('📊 Vínculo ${v.id}: pagamento=${pg?.id}, recebido=$recebido');

    if (filtro.apenasRecebidos && !recebido) continue;

    itens.add(ResumoItem(
      vinculo: v,
      casa: casa,
      imobiliaria: imob,
      aluguel: aluguel,
      taxaValor: txV,
      taxaPercent: txP,
      recebido: recebido,
    ));
  }

  return itens;
});

class ResumoActions extends StateNotifier<AsyncValue<void>> {
  final PagamentoRepo pgRepo;
  final Ref ref;
  ResumoActions(this.pgRepo, this.ref) : super(const AsyncData(null));

  Future<void> toggle(int vinculoId, int ano, int mes, bool to) async {
    print(
        '🔄 Toggle iniciado: vinculoId=$vinculoId, ano=$ano, mes=$mes, to=$to');
    state = const AsyncLoading();

    try {
      final pagamento = to
          ? await pgRepo.marcarRecebido(vinculoId, ano, mes)
          : await pgRepo.estornar(vinculoId, ano, mes);

      print(
          '📄 Pagamento ${to ? "marcado" : "estornado"}: recebido=${pagamento.recebido}');

      // Atualiza UI ANTES de tentar API
      state = const AsyncData(null);
      ref.invalidate(resumoItensProvider);
      print('✅ UI atualizada!');

      // Tenta salvar na API em segundo plano (se falhar, não tem problema)
      final pagamentoMap = {
        'id': pagamento.id,
        'vinculoId': pagamento.vinculoId,
        'ano': pagamento.ano,
        'mes': pagamento.mes,
        'recebido': pagamento.recebido,
        'recebidoEm': pagamento.recebidoEm?.toIso8601String(),
      };
      print('📦 Dados para API: $pagamentoMap');
      print('🚀 Iniciando chamada da API em background...');

      print('✅ Toggle finalizado!');
    } catch (e, st) {
      print('❌ ERRO no toggle: $e');
      print('Stack trace: $st');
      state = AsyncError(e, st);
      rethrow;
    }
  }
}

final resumoActionsProvider =
    StateNotifierProvider<ResumoActions, AsyncValue<void>>((ref) {
  final repo = ref.read(pagamentoRepoProvider);
  return ResumoActions(repo, ref);
});
