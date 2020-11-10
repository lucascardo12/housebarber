class User {
  String tipoUser;
  String login;
  String senha;

  User({String tipoUser, String login, String senha}) {
    this.tipoUser = tipoUser;
    this.login = login;
    this.senha = senha;
  }
  User.fromJson(Map<String, dynamic> xjson) {
    tipoUser = xjson['tipoUser'];
    login = xjson['login'];
    senha = xjson['senha'];
  }

  Map<String, dynamic> toJson() =>
      {'tipoUser': tipoUser, 'login': login, 'senha': senha};
  User.toMap(Map<String, dynamic> map) {
    map["tipoUser"] = tipoUser;
    map["login"] = login;
    map["senha"] = senha;
  }
}
