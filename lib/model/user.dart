import 'package:housebarber/config/global.dart';

class User {
  int id;
  String tipoUser;
  String login;
  String senha;

  User({this.tipoUser, this.login, this.senha, this.id});

  User.fromJson(Map<String, dynamic> xjson) {
    tipoUser = xjson['tipoUser'];
    login = xjson['login'];
    senha = xjson['senha'];
    id = xjson['_id'];
  }

  Map<String, dynamic> toJson() => {
        'tipoUser': tipoUser,
        'login': login.toLowerCase(),
        'senha': senha,
        '_id': id,
      };

  User.toMap(Map<String, dynamic> map) {
    map["tipoUser"] = tipoUser;
    map["login"] = login;
    map["senha"] = senha;
    map["_id"] = id;
  }

  static Future<List<User>> getData({dynamic selector}) async {
    //{'_id': data.id} selector
    try {
      List<User> data = <User>[];
      var collection = bacon.bk.collection('User');
      await collection.find(selector).forEach((element) {
        data.add(User.fromJson(element));
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
