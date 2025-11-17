// src/presentation/providers/dashboard_providers.dart
// Agregações para os cards do Dashboard.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/vinculo_repo.dart';
import '../../domain/repositories/pagamento_repo.dart';
import '../../domain/repositories/imobiliaria_repo.dart';
import '../../domain/repositories/locatario_repo.dart';
import '../../domain/repositories/casa_repo.dart';
import '_repos_provider.dart';
import 'db_provider.dart';

class DashboardResumo {
  final double totalPrevisto;
  final double totalRecebido;
  final Map<int, double> inadPorImobiliaria; // imobiliariaId -> valor
  final Map<int, double> inadPorLocatario; // locatarioId -> valor
  DashboardResumo({
    required this.totalPrevisto,
    required this.totalRecebido,
    required this.inadPorImobiliaria,
    required this.inadPorLocatario,
  });
}

/// Provider que contém o mês/ano selecionados no dashboard.
final dashboardSelectedMonthProvider =
    StateProvider<DateTime>((ref) => DateTime.now());

final dashboardResumoMesProvider = FutureProvider<DashboardResumo>((ref) async {
  await ref.watch(isarProvider.future);
  final sel = ref.watch(dashboardSelectedMonthProvider);
  final ano = sel.year;
  final mes = sel.month;

  final vincRepo = ref.read(vinculoRepoProvider);
  final pgRepo = ref.read(pagamentoRepoProvider);

  final primeiro = DateTime(ano, mes, 1);
  final ultimo = DateTime(ano, mes + 1, 0);

  final vincs = await vincRepo.list();
  final ativosNoMes = vincs.where((v) {
    final iniOk = !v.inicio.isAfter(ultimo);
    final fimOk = (v.fim == null) || !v.fim!.isBefore(primeiro);
    return iniOk && fimOk;
  }).toList();

  double totalPrev = 0;
  double totalRec = 0;
  final inadImob = <int, double>{};
  final inadLoc = <int, double>{};

  for (final v in ativosNoMes) {
    final aluguel = v.valorAluguel ?? 0;
    totalPrev += aluguel;
    final pg = await pgRepo.getByVinculoAnoMes(v.id, ano, mes);
    final rec = (pg?.recebido ?? false) ? aluguel : 0;
    totalRec += rec;

    final inad = aluguel - rec;
    if (inad > 0) {
      inadImob[v.imobiliariaId] = (inadImob[v.imobiliariaId] ?? 0) + inad;
      // locatário por id (v.locatarioId)
      inadLoc[v.locatarioId] = (inadLoc[v.locatarioId] ?? 0) + inad;
    }
  }

  return DashboardResumo(
    totalPrevisto: totalPrev,
    totalRecebido: totalRec,
    inadPorImobiliaria: inadImob,
    inadPorLocatario: inadLoc,
  );
});

// Últimos 12 meses: taxa por mês (geral) e soma de taxa por imobiliária.
class TaxaMes {
  final int ano;
  final int mes;
  final double somaTaxaValor;
  final double taxaPercentMedia; // ponderada por aluguel
  TaxaMes(this.ano, this.mes, this.somaTaxaValor, this.taxaPercentMedia);
}

final dashboardUltimos12Provider = FutureProvider<List<TaxaMes>>((ref) async {
  await ref.watch(isarProvider.future);
  final vincRepo = ref.read(vinculoRepoProvider);

  final now = DateTime.now();
  final base = DateTime(now.year, now.month, 1);

  final vincs = await vincRepo.list();
  final result = <TaxaMes>[];

  for (int i = 11; i >= 0; i--) {
    final dt = DateTime(base.year, base.month - i, 1);
    final primeiro = dt;
    final ultimo = DateTime(dt.year, dt.month + 1, 0);

    double somaAluguel = 0;
    double somaTaxaV = 0;

    for (final v in vincs) {
      final iniOk = !v.inicio.isAfter(ultimo);
      final fimOk = (v.fim == null) || !v.fim!.isBefore(primeiro);
      if (!iniOk || !fimOk) continue;

      final aluguel = v.valorAluguel ?? 0;
      final taxaV = v.taxaValor ?? ((aluguel) * ((v.taxaPercent ?? 0) / 100));
      somaAluguel += aluguel;
      somaTaxaV += taxaV;
    }

    final taxaPercentMedia =
        (somaAluguel == 0) ? 0 : (somaTaxaV / somaAluguel) * 100;
    result.add(
        TaxaMes(dt.year, dt.month, somaTaxaV, taxaPercentMedia.toDouble()));
  }

  return result;
});

// ----- Novos providers solicitados pelo usuário -----

class ImobiliariaTaxa {
  final int imobiliariaId;
  final double somaTaxaValor;
  ImobiliariaTaxa(this.imobiliariaId, this.somaTaxaValor);
}

final dashboardTaxaPorImobiliariaProvider =
    FutureProvider<List<ImobiliariaTaxa>>((ref) async {
  await ref.watch(isarProvider.future);
  final sel = ref.watch(dashboardSelectedMonthProvider);
  final ano = sel.year;
  final mes = sel.month;

  final vincRepo = ref.read(vinculoRepoProvider);

  final primeiro = DateTime(ano, mes, 1);
  final ultimo = DateTime(ano, mes + 1, 0);

  final vincs = await vincRepo.list();

  final imobMap = <int, double>{};

  for (final v in vincs) {
    final iniOk = !v.inicio.isAfter(ultimo);
    final fimOk = (v.fim == null) || !v.fim!.isBefore(primeiro);
    if (!iniOk || !fimOk) continue;

    final aluguel = v.valorAluguel ?? 0;
    final taxaV = v.taxaValor ?? ((aluguel) * ((v.taxaPercent ?? 0) / 100));
    imobMap[v.imobiliariaId] = (imobMap[v.imobiliariaId] ?? 0) + taxaV;
  }

  final list =
      imobMap.entries.map((e) => ImobiliariaTaxa(e.key, e.value)).toList();
  // sort descending by taxa
  list.sort((a, b) => b.somaTaxaValor.compareTo(a.somaTaxaValor));
  return list;
});

class OpenFinanceItem {
  final String casaNome;
  final String imobiliariaNome;
  final double valor;
  final int ano;
  final int mes;
  OpenFinanceItem(
      {required this.casaNome,
      required this.imobiliariaNome,
      required this.valor,
      required this.ano,
      required this.mes});
}

final dashboardAbertosAnterioresProvider =
    FutureProvider<List<OpenFinanceItem>>((ref) async {
  final sel = ref.watch(dashboardSelectedMonthProvider);
  final anoSel = sel.year;
  final mesSel = sel.month;

  final vincRepo = ref.read(vinculoRepoProvider);
  final casaRepo = ref.read(casaRepoProvider);
  final imobRepo = ref.read(imobiliariaRepoProvider);
  final pgRepo = ref.read(pagamentoRepoProvider);

  final result = <OpenFinanceItem>[];

  // Itera sobre todos os meses anteriores ao mês selecionado (últimos 5 anos)
  final startYear = anoSel - 5;
  for (int y = startYear; y <= anoSel; y++) {
    for (int m = 1; m <= 12; m++) {
      // Pula meses iguais ou posteriores ao selecionado
      if (y == anoSel && m >= mesSel) continue; // use continue, não break!
      if (y > anoSel) break; // para no ano posterior

      final primeiro = DateTime(y, m, 1);
      final ultimo = DateTime(y, m + 1, 0);

      // Busca todos os vínculos ativos naquele mês
      final vincs = await vincRepo.list();
      for (final v in vincs) {
        final iniOk = !v.inicio.isAfter(ultimo);
        final fimOk = (v.fim == null) || !v.fim!.isBefore(primeiro);
        if (!iniOk || !fimOk) continue; // não estava ativo naquele mês

        // Verifica se há pagamento registrado para este vínculo/ano/mês
        final pg = await pgRepo.getByVinculoAnoMes(v.id, y, m);
        final recebido = pg?.recebido ?? false;

        // Se não foi recebido, adiciona à lista de abertos
        if (!recebido) {
          final casa = await casaRepo.getById(v.casaId);
          final imob = await imobRepo.getById(v.imobiliariaId);

          result.add(OpenFinanceItem(
            casaNome: casa?.descricao ?? 'Casa #${v.casaId}',
            imobiliariaNome: imob?.nome ?? 'Imob #${v.imobiliariaId}',
            valor: v.valorAluguel ?? 0,
            ano: y,
            mes: m,
          ));
        }
      }
    }
  }

  // sort by ano/mes asc (oldest first)
  result.sort((a, b) =>
      (a.ano == b.ano) ? a.mes.compareTo(b.mes) : a.ano.compareTo(b.ano));
  return result;
});
