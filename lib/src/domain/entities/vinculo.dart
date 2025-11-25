// src/domain/entities/vinculo.dart
// Entidade Vinculo (Casa + Imobiliaria + Locatario) com regras de vigência.

class Vinculo {
  int id = 0;

  late int casaId; // *
  late int imobiliariaId; // *
  late int locatarioId; // *

  // Financeiro
  double? valorAluguel;
  double? taxaPercent; // %
  double? taxaValor; // R$

  // Vigência
  late DateTime inicio; // *
  DateTime? fim; // null => ativo

  late DateTime createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'casaId': casaId,
      'imobiliariaId': imobiliariaId,
      'locatarioId': locatarioId,
      'valorAluguel': valorAluguel,
      'taxaPercent': taxaPercent,
      'taxaValor': taxaValor,
      'inicio': inicio.toIso8601String(),
      'fim': fim?.toIso8601String(),
    };
  }
}
