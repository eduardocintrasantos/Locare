// Mostra: total previsto x recebido, inadimplência por imobiliária e locatário,
// e últimos 12 meses (taxa em R$ e % média) com barras simples.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/dashboard_providers.dart';
import '../../providers/imobiliaria_providers.dart';
import '../../providers/locatario_providers.dart';
import '../../../domain/entities/imobiliaria.dart';
import '../../../domain/entities/locatario.dart';
import '../../../core/utils/id.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumo = ref.watch(dashboardResumoMesProvider);
    final ult12  = ref.watch(dashboardUltimos12Provider);
    final imobs  = ref.watch(imobiliariasListProvider).value ?? [];
    final locs   = ref.watch(locatariosListProvider).value ?? [];

    String imobName(int id) => imobs.firstWhere((i) => i.id == id, orElse: () => Imobiliaria()..nome='?').nome;
    String locName (int id) => locs.firstWhere((l) => l.id == id, orElse: () => Locatario()..nome='?').nome;

    Future<void> _onRefresh() async {
      // Invalida todos os providers do dashboard para recarregar
      ref.invalidate(dashboardResumoMesProvider);
      ref.invalidate(dashboardUltimos12Provider);
      ref.invalidate(imobiliariasListProvider);
      ref.invalidate(locatariosListProvider);
      // Aguarda um dos providers recarregar
      await ref.refresh(dashboardResumoMesProvider.future);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Início')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            resumo.when(
              data: (r) {
                final perc = r.totalPrevisto == 0 ? 0 : (r.totalRecebido / r.totalPrevisto);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mês atual', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: _numberCard('Previsto', formatMoney(r.totalPrevisto))),
                        const SizedBox(width: 8),
                        Expanded(child: _numberCard('Recebido', formatMoney(r.totalRecebido))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _bar('Progresso', perc.toDouble()),
                    const SizedBox(height: 16),
                    Text('Inadimplência por imobiliária', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    ...r.inadPorImobiliaria.entries.map((e) {
                      final v = e.value;
                      final p = r.totalPrevisto == 0 ? 0 : v / r.totalPrevisto;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(child: Text(imobName(e.key))),
                            SizedBox(width: 120, child: _miniBar(p.toDouble())),
                            const SizedBox(width: 8),
                            Text(formatMoney(v)),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    Text('Inadimplência por locatário', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    ...r.inadPorLocatario.entries.map((e) {
                      final v = e.value;
                      final p = r.totalPrevisto == 0 ? 0 : v / r.totalPrevisto;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(child: Text(locName(e.key))),
                            SizedBox(width: 120, child: _miniBar(p.toDouble())),
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
          Text('Últimos 12 meses (taxas)', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ult12.when(
            data: (lista) {
              final maxV = (lista.map((t) => t.somaTaxaValor).fold<double>(0, (a, b) => a > b ? a : b)).clamp(1, double.infinity);
              return Column(
                children: lista.map((t) {
                  final label = '${t.mes.toString().padLeft(2, '0')}/${t.ano}';
                  final p = t.somaTaxaValor / maxV;
                  return Card(
                    child: ListTile(
                      title: Text('$label • Taxa ${formatMoney(t.somaTaxaValor)}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _bar('R\$ taxa', p),
                          const SizedBox(height: 4),
                          Text('Taxa média: ${t.taxaPercentMedia.toStringAsFixed(2)}%'),
                        ],
                      ),
                    ),
                  );
                }).toList(),
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
