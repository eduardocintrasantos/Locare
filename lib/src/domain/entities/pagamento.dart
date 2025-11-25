// src/domain/entities/pagamento.dart
// Entidade Pagamento por (vinculoId, ano, mes). Marca recebido/estornado.

class Pagamento {
  int id = 0;

  late int vinculoId; // *
  late int ano; // *
  late int mes; // * 1..12

  late bool recebido; // toggle
  DateTime? recebidoEm; // quando confirmou

  late DateTime createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vinculoId': vinculoId,
      'ano': ano,
      'mes': mes,
      'recebido': recebido,
      'recebidoEm': recebidoEm?.toIso8601String(),
    };
  }
}
