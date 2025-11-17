// Mostra: dados do dashboard com seletor de ano/mês, taxa por imobiliária, financeiros em atraso.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/dashboard_providers.dart';
import '../../providers/imobiliaria_providers.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../core/utils/id.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late ScrollController _monthScrollController;

  @override
  void initState() {
    super.initState();
    _monthScrollController = ScrollController();
  }

  @override
  void dispose() {
    _monthScrollController.dispose();
    super.dispose();
  }

  void _selectMonth(DateTime dt) {
    ref.read(dashboardSelectedMonthProvider.notifier).state = dt;
  }

  void _previousYear() {
    final current = ref.read(dashboardSelectedMonthProvider);
    final prev = DateTime(current.year - 1, current.month, 1);
    _selectMonth(prev);
  }

  void _nextYear() {
    final current = ref.read(dashboardSelectedMonthProvider);
    final next = DateTime(current.year + 1, current.month, 1);
    _selectMonth(next);
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(dashboardSelectedMonthProvider);
    final resumo = ref.watch(dashboardResumoMesProvider);
    final taxasImob = ref.watch(dashboardTaxaPorImobiliariaProvider);
    final abertos = ref.watch(dashboardAbertosAnterioresProvider);
    final imobs = ref.watch(imobiliariasListProvider).value ?? [];

    String imobName(int id) => imobs
        .firstWhere((i) => i.id == id, orElse: () => Imobiliaria()..nome = '?')
        .nome;

    Future<void> _onRefresh() async {
      ref.invalidate(dashboardSelectedMonthProvider);
      ref.invalidate(dashboardResumoMesProvider);
      ref.invalidate(dashboardTaxaPorImobiliariaProvider);
      ref.invalidate(dashboardAbertosAnterioresProvider);
      ref.invalidate(imobiliariasListProvider);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Início')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Year Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: _previousYear,
                    icon: const Icon(Icons.chevron_left)),
                Text(selected.year.toString(),
                    style: Theme.of(context).textTheme.titleLarge),
                IconButton(
                    onPressed: _nextYear,
                    icon: const Icon(Icons.chevron_right)),
              ],
            ),
            const SizedBox(height: 12),

            // Month Scroller
            SizedBox(
              height: 60,
              child: ListView.builder(
                controller: _monthScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (ctx, idx) {
                  final m = idx + 1;
                  final dt = DateTime(selected.year, m, 1);
                  final monthNames = [
                    'Jan',
                    'Fev',
                    'Mar',
                    'Abr',
                    'Mai',
                    'Jun',
                    'Jul',
                    'Ago',
                    'Set',
                    'Out',
                    'Nov',
                    'Dez'
                  ];
                  final isSelected = selected.month == m;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ElevatedButton(
                      onPressed: () => _selectMonth(dt),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelected ? Colors.blue : Colors.grey[300],
                        foregroundColor:
                            isSelected ? Colors.white : Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      child: Text(monthNames[idx]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Resumo: Previsto e Recebido
            resumo.when(
              data: (r) {
                final perc = r.totalPrevisto == 0
                    ? 0
                    : (r.totalRecebido / r.totalPrevisto);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mês selecionado',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                            child: _numberCard(
                                'Previsto', formatMoney(r.totalPrevisto))),
                        const SizedBox(width: 8),
                        Expanded(
                            child: _numberCard(
                                'Recebido', formatMoney(r.totalRecebido))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _bar('Progresso', perc.toDouble()),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erro: $e'),
            ),
            const SizedBox(height: 24),

            // Inadimplência por Imobiliária
            resumo.when(
              data: (r) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Inadimplência por imobiliária',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (r.inadPorImobiliaria.isEmpty)
                      const Text('Sem inadimplências')
                    else
                      ...r.inadPorImobiliaria.entries.map((e) {
                        final v = e.value;
                        final p =
                            r.totalPrevisto == 0 ? 0 : v / r.totalPrevisto;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Expanded(child: Text(imobName(e.key))),
                              SizedBox(
                                  width: 120, child: _miniBar(p.toDouble())),
                              const SizedBox(width: 8),
                              Text(formatMoney(v)),
                            ],
                          ),
                        );
                      }),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erro: $e'),
            ),
            const SizedBox(height: 24),

            // Taxa por Imobiliária no Mês Selecionado
            taxasImob.when(
              data: (lista) {
                if (lista.isEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Taxa por imobiliária',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      const Text('Sem taxas para este mês'),
                    ],
                  );
                }
                final totalTaxas = lista.fold<double>(
                    0, (sum, item) => sum + item.somaTaxaValor);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Taxa por imobiliária',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    // Card com total geral
                    Card(
                      color: const Color.fromARGB(255, 96, 113, 126),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total de Taxas',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(formatMoney(totalTaxas),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Taxas por imobiliária
                    ...lista.map((item) {
                      final perc = totalTaxas == 0
                          ? 0.0
                          : item.somaTaxaValor / totalTaxas;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(imobName(item.imobiliariaId))),
                                Text(formatMoney(item.somaTaxaValor),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            _miniBar(perc.toDouble()),
                          ],
                        ),
                      );
                    }),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erro: $e'),
            ),
            const SizedBox(height: 24),

            // Financeiros em Aberto de Meses Anteriores
            abertos.when(
              data: (lista) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Financeiros em aberto (meses anteriores)',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (lista.isEmpty)
                      const Text(
                          'Nenhum financeiro em aberto de meses anteriores')
                    else
                      ...lista.map((item) {
                        final monthNames = [
                          'Jan',
                          'Fev',
                          'Mar',
                          'Abr',
                          'Mai',
                          'Jun',
                          'Jul',
                          'Ago',
                          'Set',
                          'Out',
                          'Nov',
                          'Dez'
                        ];
                        final mesLabel = monthNames[item.mes - 1];
                        return Card(
                          child: ListTile(
                            title: Text(item.casaNome),
                            subtitle: Text(
                                '${item.imobiliariaNome} • $mesLabel/${item.ano}'),
                            trailing: Text(formatMoney(item.valor),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ),
                        );
                      }),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Erro: $e'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20)),
        ]),
      ),
    );
  }

  Widget _bar(String label, double percent) {
    percent = percent.clamp(0, 1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(value: percent, minHeight: 10),
        ),
      ],
    );
  }

  Widget _miniBar(double percent) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LinearProgressIndicator(value: percent.clamp(0, 1), minHeight: 8),
    );
  }
}
