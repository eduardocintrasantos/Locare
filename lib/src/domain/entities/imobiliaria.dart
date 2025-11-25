// src/domain/entities/imobiliaria.dart
// Entidade Imobiliaria.

class Imobiliaria {
  int id = 0;

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cnpj': cnpj,
      'rua': rua,
      'cep': cep,
      'bairro': bairro,
      'numero': numero,
      'telefone': telefone,
      'nomeContato': nomeContato,
    };
  }
}
