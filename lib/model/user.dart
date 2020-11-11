import 'package:mongo_dart/mongo_dart.dart';

class User {
  int id;
  String tipoUser;
  String login;
  String senha;

  User({String tipoUser, String login, String senha, int id}) {
    this.tipoUser = tipoUser;
    this.login = login;
    this.senha = senha;
    this.id = id;
  }
  User.fromJson(Map<String, dynamic> xjson) {
    tipoUser = xjson['tipoUser'];
    login = xjson['login'];
    senha = xjson['senha'];
    id = xjson['_id'];
  }

  Map<String, dynamic> toJson() => {
        'tipoUser': tipoUser,
        'login': login,
        'senha': senha,
        '_id': id,
      };
  User.toMap(Map<String, dynamic> map) {
    map["tipoUser"] = tipoUser;
    map["login"] = login;
    map["senha"] = senha;
    map["_id"] = id;
  }
}
