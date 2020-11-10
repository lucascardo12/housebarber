class Funcionario {
  String nome;
  String numero;
  String cpf;
  String email;

  Funcionario(
      {String nome, String numero, String cpf, String email, String senha}) {
    this.numero = numero;
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
  }
  Funcionario.fromJson(Map<String, dynamic> xjson) {
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() =>
      {'nome': nome, 'numero': numero, 'email': email, 'cpf': cpf};
  Funcionario.toMap(Map<String, dynamic> map) {
    map["nome"] = nome;
    map["numero"] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }
}
