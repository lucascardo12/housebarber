class User {
  int id;
  String login;
  String senha;
  String nome;
  String numero;
  String cnpj;
  String email;
  String tokenGotify;
  DateTime dtPagamento;

  User({
    this.login,
    this.senha,
    this.id,
    this.nome,
    this.numero,
    this.cnpj,
    this.email,
    this.dtPagamento,
    this.tokenGotify,
  });

  User.fromJson(Map<String, dynamic> xjson) {
    login = xjson['login'];
    senha = xjson['senha'];
    id = xjson['_id'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    cnpj = xjson['cnpj'];
    email = xjson['email'];
    dtPagamento = xjson['dtPagamento'];
    tokenGotify = xjson['tokenGotify'];
  }

  Map<String, dynamic> toJson() => {
        'login': login.toLowerCase(),
        'senha': senha,
        '_id': id,
        'nome': nome,
        'numero': numero,
        'cnpj': cnpj,
        'email': email,
        'dtPagamento': dtPagamento,
        'tokenGotify': tokenGotify
      };

  User.toMap(Map<String, dynamic> map) {
    map["login"] = login;
    map["senha"] = senha;
    map["_id"] = id;
    map['nome'] = nome;
    map['numero'] = numero;
    map['cnpj'] = cnpj;
    map['email'] = email;
    map['dtPagamento'] = dtPagamento;
    map['tokenGotify'] = tokenGotify;
  }
}
