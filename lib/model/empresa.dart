class Empresa {
  String nome;
  String numero;
  String cnpj;
  String email;
  String senha;
  String fornecedor;
  List<Clientes> listClient;
  List<Funcionarios> listFunc;

  Empresa(
      {String numero,
      String nome,
      String senha,
      String email,
      String cnpj,
      String fornecedor,
      List<Clientes> listClient,
      List<Funcionarios> listFunc}) {
    this.numero = numero;
    this.nome = nome;
    this.senha = senha;
    this.email = email;
    this.listClient = listClient;
    this.listFunc = listFunc;
  }
  Empresa.fromJson(Map<String, dynamic> xjson) {
    nome = xjson['nome'];
    senha = xjson['senha'];
    numero = xjson['numero'];
    email = xjson['email'];
    listClient = xjson['listClient'];
    listFunc = xjson['listFunc'];
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'senha': senha,
        'numero': numero,
        'email': email,
        'listClient': listClient,
        'listFunc': listFunc,
      };
  Empresa.toMap(Map<String, dynamic> map) {
    map["nome"] = nome;
    map["senha"] = senha;
    map["numero"] = numero;
    map['email'] = email;
    map['listClient'] = listClient;
    map['listFunc'] = listFunc;
  }
}
