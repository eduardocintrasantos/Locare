// src/domain/entities/vinculo.dart
// Entidade Vinculo (Casa + Imobiliaria + Locatario) com regras de vigência.

import 'package:isar/isar.dart';

part 'vinculo.g.dart';

@collection
class Vinculo {
  Id id = Isar.autoIncrement;

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
