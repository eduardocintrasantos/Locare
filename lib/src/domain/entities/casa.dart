// src/domain/entities/casa.dart
// Entidade Casa.
// Nota: O vínculo com Imobiliária é feito apenas na tabela TVINCULOS.

class Casa {
  int id = 0;

  late String descricao; // *
  String? rua;
  String? numero;
  String? cep;
  String? bairro;

  // O vínculo com imobiliária é feito na tabela TVINCULOS, não diretamente aqui

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
    };
  }
}
