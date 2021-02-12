import 'package:housebarber/config/global.dart';

class Funcionario {
  int id;
  int idUser;
  String nome;
  String numero;
  String cpf;
  String email;

  Funcionario(
      {this.id, this.idUser, this.numero, this.nome, this.email, this.cpf});

  Funcionario.fromJson(Map<String, dynamic> xjson) {
    id = xjson['_id'];
    idUser = xjson['idUser'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
        'cpf': cpf
      };
  Funcionario.toMap(Map<String, dynamic> map) {
    map['_id'] = id;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }

  static Future<List<Funcionario>> getData({dynamic selector}) async {
    //{'_id': data.id} selector
    try {
      List<Funcionario> data = <Funcionario>[];
      var collection = bacon.bk.collection('Funcionario');
      await collection.find(selector).forEach((element) {
        data.add(Funcionario.fromJson(element));
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
