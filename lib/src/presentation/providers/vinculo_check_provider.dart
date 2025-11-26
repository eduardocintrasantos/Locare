// src/presentation/providers/vinculo_check_provider.dart
// Provider para verificar vínculos ativos antes de excluir/inativar

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vinculo_providers.dart';

/// Resultado da verificação de vínculos
class VinculoCheckResult {
  final bool temVinculoAtivo;
  final bool temVinculoFinalizado;
  final int quantidadeAtivos;
  final int quantidadeFinalizados;

  const VinculoCheckResult({
    required this.temVinculoAtivo,
    required this.temVinculoFinalizado,
    required this.quantidadeAtivos,
    required this.quantidadeFinalizados,
  });

  bool get podeExcluir => !temVinculoAtivo && !temVinculoFinalizado;
  bool get podeInativar => !temVinculoAtivo && temVinculoFinalizado;
  bool get temQualquerVinculo => temVinculoAtivo || temVinculoFinalizado;
}

/// Provider para verificar vínculos de uma imobiliária
final vinculosImobiliariaProvider =
    FutureProvider.family<VinculoCheckResult, int>((ref, imobiliariaId) async {
  final vinculos = await ref.watch(vinculosListProvider.future);

  final vinculosImob = vinculos.where((v) => v.imobiliariaId == imobiliariaId);
  final ativos = vinculosImob.where((v) => v.fim == null).length;
  final finalizados = vinculosImob.where((v) => v.fim != null).length;

  return VinculoCheckResult(
    temVinculoAtivo: ativos > 0,
    temVinculoFinalizado: finalizados > 0,
    quantidadeAtivos: ativos,
    quantidadeFinalizados: finalizados,
  );
});

/// Provider para verificar vínculos de uma casa
final vinculosCasaProvider =
    FutureProvider.family<VinculoCheckResult, int>((ref, casaId) async {
  final vinculos = await ref.watch(vinculosListProvider.future);

  final vinculosCasa = vinculos.where((v) => v.casaId == casaId);
  final ativos = vinculosCasa.where((v) => v.fim == null).length;
  final finalizados = vinculosCasa.where((v) => v.fim != null).length;

  return VinculoCheckResult(
    temVinculoAtivo: ativos > 0,
    temVinculoFinalizado: finalizados > 0,
    quantidadeAtivos: ativos,
    quantidadeFinalizados: finalizados,
  );
});

/// Provider para verificar vínculos de um locatário
final vinculosLocatarioProvider =
    FutureProvider.family<VinculoCheckResult, int>((ref, locatarioId) async {
  final vinculos = await ref.watch(vinculosListProvider.future);

  final vinculosLoc = vinculos.where((v) => v.locatarioId == locatarioId);
  final ativos = vinculosLoc.where((v) => v.fim == null).length;
  final finalizados = vinculosLoc.where((v) => v.fim != null).length;

  return VinculoCheckResult(
    temVinculoAtivo: ativos > 0,
    temVinculoFinalizado: finalizados > 0,
    quantidadeAtivos: ativos,
    quantidadeFinalizados: finalizados,
  );
});
