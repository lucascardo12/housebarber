class Funcionario {
  String nome;
  String numero;
  String cpf;
  String email;
  String senha;

  Funcionario(
      {String nome, String numero, String cpf, String email, String senha}) {
    this.numero = numero;
    this.nome = nome;
    this.senha = senha;
    this.email = email;
    this.cpf = cpf;
  }
  Funcionario.fromJson(Map<String, dynamic> xjson) {
    nome = xjson['nome'];
    senha = xjson['senha'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'senha': senha,
        'numero': numero,
        'email': email,
        'cpf': cpf
      };
  Funcionario.toMap(Map<String, dynamic> map) {
    map["nome"] = nome;
    map["senha"] = senha;
    map["numero"] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }
}
