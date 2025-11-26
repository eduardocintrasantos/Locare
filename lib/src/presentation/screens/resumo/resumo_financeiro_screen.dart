// Filtros: Ano, Mês, Imobiliária (Todas/específicas) e chip "Recebidos".
// Lista por casa com switch que confirma marcar/estornar recebimento.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/providers/resumo_financeiro_providers.dart';
import '../../../presentation/providers/imobiliaria_providers.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../presentation/widgets/confirm_dialog.dart';
import '../../../core/utils/id.dart';

class ResumoFinanceiroScreen extends ConsumerStatefulWidget {
  const ResumoFinanceiroScreen({super.key});

  @override
  ConsumerState<ResumoFinanceiroScreen> createState() =>
      _ResumoFinanceiroScreenState();
}

class _ResumoFinanceiroScreenState
    extends ConsumerState<ResumoFinanceiroScreen> {
  // Map de vínculos que estão processando: vinculoId -> valor esperado (true=recebido, false=não recebido)
  final Map<int, bool> _processando = {};

  @override
  Widget build(BuildContext context) {
    final itens = ref.watch(resumoItensProvider);
    final filtro = ref.watch(resumoFiltroProvider);
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];

    // Limpa itens do _processando que já foram atualizados
    if (itens.hasValue) {
      final list = itens.value!;
      _processando.removeWhere((vinculoId, expectedValue) {
        final item = list.where((it) => it.vinculo.id == vinculoId).firstOrNull;
        // Remove se o item não existe mais ou se já tem o valor esperado
        return item == null || item.recebido == expectedValue;
      });
    }

    // Gera opções de ano/mês a partir do agora e últimos 24 meses (suficiente no MVP).
    final now = DateTime.now();
    final meses =
        List.generate(24, (i) => DateTime(now.year, now.month - i, 1));
    final anos = meses.map((d) => d.year).toSet().toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo Financeiro'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Wrap(
              spacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                DropdownButton<int>(
                  value: filtro.ano,
                  underline: const SizedBox(),
                  items: anos
                      .map((y) => DropdownMenuItem(value: y, child: Text('$y')))
                      .toList(),
                  onChanged: (y) {
                    final m = filtro.mes;
                    ref.read(resumoFiltroProvider.notifier).state =
                        ResumoFiltro(
                            ano: y!,
                            mes: m,
                            imobiliariaId: filtro.imobiliariaId,
                            apenasRecebidos: filtro.apenasRecebidos);
                  },
                ),
                DropdownButton<int>(
                  value: filtro.mes,
                  underline: const SizedBox(),
                  items: List.generate(12, (i) => i + 1)
                      .map((m) => DropdownMenuItem(
                          value: m, child: Text(m.toString().padLeft(2, '0'))))
                      .toList(),
                  onChanged: (m) {
                    ref.read(resumoFiltroProvider.notifier).state =
                        ResumoFiltro(
                            ano: filtro.ano,
                            mes: m!,
                            imobiliariaId: filtro.imobiliariaId,
                            apenasRecebidos: filtro.apenasRecebidos);
                  },
                ),
                DropdownButton<int?>(
                  value: filtro.imobiliariaId,
                  underline: const SizedBox(),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('Todas')),
                    ...imobs.map((Imobiliaria i) =>
                        DropdownMenuItem(value: i.id, child: Text(i.nome))),
                  ],
                  onChanged: (v) {
                    ref.read(resumoFiltroProvider.notifier).state =
                        ResumoFiltro(
                            ano: filtro.ano,
                            mes: filtro.mes,
                            imobiliariaId: v,
                            apenasRecebidos: filtro.apenasRecebidos);
                  },
                ),
                FilterChip(
                  label: const Text('Recebidos'),
                  selected: filtro.apenasRecebidos,
                  onSelected: (s) {
                    ref.read(resumoFiltroProvider.notifier).state =
                        ResumoFiltro(
                            ano: filtro.ano,
                            mes: filtro.mes,
                            imobiliariaId: filtro.imobiliariaId,
                            apenasRecebidos: s);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: itens.when(
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Nada para exibir nesse período.'));
          }
          return ListView.separated(
            itemCount: list.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final it = list[i];
              final isProcessando = _processando.containsKey(it.vinculo.id);

              return ListTile(
                title: Text(it.casa.descricao),
                subtitle: Text(
                    '${it.imobiliaria.nome} • Aluguel ${formatMoney(it.aluguel)} • Taxa ${formatMoney(it.taxaValor)} (${it.taxaPercent.toStringAsFixed(2)}%)'),
                trailing: isProcessando
                    ? const SizedBox(
                        width: 48,
                        height: 24,
                        child: Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    : Switch(
                        value: it.recebido,
                        onChanged: (to) async {
                          final ok = await confirmDialog(
                            context,
                            title: to
                                ? 'Confirmar recebimento?'
                                : 'Estornar recebimento?',
                            message: to
                                ? 'Marcar como recebido?'
                                : 'Marcar como não recebido?',
                          );
                          if (!ok) return;

                          // Marca como processando com o valor esperado
                          setState(() => _processando[it.vinculo.id] = to);

                          try {
                            await ref
                                .read(resumoActionsProvider.notifier)
                                .toggle(
                                    it.vinculo.id, filtro.ano, filtro.mes, to);
                            // NÃO remove do _processando aqui!
                            // O build vai remover automaticamente quando a lista atualizar
                          } catch (e) {
                            // Em caso de erro, remove do processando
                            if (mounted) {
                              setState(
                                  () => _processando.remove(it.vinculo.id));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Erro: $e')),
                              );
                            }
                          }
                        },
                      ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
      ),
    );
  }
}
