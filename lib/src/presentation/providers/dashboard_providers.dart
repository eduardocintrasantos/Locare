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
  final Map<int, double> inadPorLocatario;   // locatarioId -> valor
  DashboardResumo({
    required this.totalPrevisto,
    required this.totalRecebido,
    required this.inadPorImobiliaria,
    required this.inadPorLocatario,
  });
}

final dashboardResumoMesProvider = FutureProvider<DashboardResumo>((ref) async {
  await ref.watch(isarProvider.future);
  final now = DateTime.now();
  final ano = now.year;
  final mes = now.month;

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

    final taxaPercentMedia = (somaAluguel == 0) ? 0 : (somaTaxaV / somaAluguel) * 100;
    result.add(TaxaMes(dt.year, dt.month, somaTaxaV, taxaPercentMedia.toDouble()));
  }

  return result;
});
