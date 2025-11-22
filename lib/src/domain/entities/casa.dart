// src/domain/entities/casa.dart
// Entidade Casa no Isar.

import 'package:isar/isar.dart';

part 'casa.g.dart';

@collection
class Casa {
  Id id = Isar.autoIncrement;

  late String descricao; // *
  String? rua;
  String? numero;
  String? cep;
  String? bairro;

  int? imobiliariaId; // referência simples por ID

  late DateTime createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'rua': rua,
      'numero': numero,
      'cep': cep,
      'bairro': bairro,
      'imobiliariaId': imobiliariaId,
    };
  }
}
