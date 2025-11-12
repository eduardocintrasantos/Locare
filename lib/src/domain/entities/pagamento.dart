// src/domain/entities/pagamento.dart
// Entidade Pagamento por (vinculoId, ano, mes). Marca recebido/estornado.

import 'package:isar/isar.dart';

part 'pagamento.g.dart';

@collection
class Pagamento {
  Id id = Isar.autoIncrement;

  late int vinculoId; // *
  late int ano;       // *
  late int mes;       // * 1..12

  late bool recebido;     // toggle
  DateTime? recebidoEm;   // quando confirmou

  late DateTime createdAt;
  DateTime? updatedAt;
}
