// src/domain/entities/locatario.dart
// Entidade Locatario.

class Locatario {
  int id = 0;

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
