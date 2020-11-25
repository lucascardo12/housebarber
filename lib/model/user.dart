class User {
  String idUser;
  String tipoUser;
  String login;
  String senha;

  User({String tipoUser, String login, String senha, String idUser}) {
    this.tipoUser = tipoUser;
    this.login = login;
    this.senha = senha;
    this.idUser = idUser;
  }
  User.fromJson(Map<String, dynamic> xjson) {
    tipoUser = xjson['tipoUser'];
    login = xjson['login'];
    senha = xjson['senha'];
    idUser = xjson['_id'];
  }

  Map<String, dynamic> toJson() => {
        'tipoUser': tipoUser,
        'login': login,
        'senha': senha,
        '_id': idUser,
      };
  User.toMap(Map<String, dynamic> map) {
    map["tipoUser"] = tipoUser;
    map["login"] = login;
    map["senha"] = senha;
    map["_id"] = idUser;
  }
}
