import 'package:housebarber/config/global.dart';

class User {
  int id;
  String tipoUser;
  String login;
  String senha;
  String nome;
  String numero;
  String cnpj;
  String email;

  User({
    this.tipoUser,
    this.login,
    this.senha,
    this.id,
    this.nome,
    this.numero,
    this.cnpj,
    this.email,
  });

  User.fromJson(Map<String, dynamic> xjson) {
    tipoUser = xjson['tipoUser'];
    login = xjson['login'];
    senha = xjson['senha'];
    id = xjson['_id'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    cnpj = xjson['cnpj'];
    email = xjson['email'];
  }

  Map<String, dynamic> toJson() => {
        'tipoUser': tipoUser,
        'login': login.toLowerCase(),
        'senha': senha,
        '_id': id,
        'nome': nome,
        'numero': numero,
        'cnpj': cnpj,
        'email': email,
      };

  User.toMap(Map<String, dynamic> map) {
    map["tipoUser"] = tipoUser;
    map["login"] = login;
    map["senha"] = senha;
    map["_id"] = id;
    map['nome'] = nome;
    map['numero'] = numero;
    map['cnpj'] = cnpj;
    map['email'] = email;
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
