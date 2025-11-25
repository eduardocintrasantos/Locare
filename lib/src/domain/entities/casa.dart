// src/domain/entities/casa.dart
// Entidade Casa.

class Casa {
  int id = 0;

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
