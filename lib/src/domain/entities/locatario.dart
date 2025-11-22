// src/domain/entities/locatario.dart
// Entidade Locatario no Isar.

import 'package:isar/isar.dart';

part 'locatario.g.dart';

@collection
class Locatario {
  Id id = Isar.autoIncrement;

  late String nome; // *
  String? cpf;
  String? rg;
  String? telefone;
  String? celular;

  // Fiador
  String? fiadorNome;
  String? fiadorCpf;
  String? fiadorRg;
  String? fiadorTelefone;
  String? fiadorCelular;

  late DateTime createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'rg': rg,
      'telefone': telefone,
      'celular': celular,
      'fiadorNome': fiadorNome,
      'fiadorCpf': fiadorCpf,
      'fiadorRg': fiadorRg,
      'fiadorTelefone': fiadorTelefone,
      'fiadorCelular': fiadorCelular,
    };
  }
}
