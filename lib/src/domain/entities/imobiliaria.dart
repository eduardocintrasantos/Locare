// src/domain/entities/imobiliaria.dart
// Entidade Imobiliaria no Isar.

import 'package:isar/isar.dart';

part 'imobiliaria.g.dart';

@collection
class Imobiliaria {
  Id id = Isar.autoIncrement;

  late String nome; // *
  String? cnpj;
  String? rua;
  String? cep;
  String? bairro;
  String? numero;
  String? telefone;
  String? nomeContato;

  late DateTime createdAt;
  DateTime? updatedAt;
}
