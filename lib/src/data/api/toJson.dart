class Imobiliaria {
  int id;
  String nome;
  String? cnpj;
  String? rua;
  String? cep;
  String? bairro;
  String? numero;
  String? telefone;
  String? nomeContato;

  Imobiliaria({
    required this.id,
    required this.nome,
    this.cnpj,
    this.rua,
    this.cep,
    this.bairro,
    this.numero,
    this.telefone,
    this.nomeContato,
  });

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

class Casa {
  int id;
  String descricao;
  String? rua;
  String? numero;
  String? cep;
  String? bairro;
  int? imobiliariaId;

  Casa({
    required this.id,
    required this.descricao,
    this.rua,
    this.numero,
    this.cep,
    this.bairro,
    this.imobiliariaId,
  });

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
