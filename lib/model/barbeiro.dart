import 'package:housebarber/config/global.dart';

class Barbeiro {
  int id;
  int idUser;
  String nome;
  String numero;
  String cnpj;
  String email;
  String fornecedor;

  Barbeiro({
    this.id,
    this.idUser,
    this.numero,
    this.nome,
    this.email,
  });

  Barbeiro.fromJson(Map<String, dynamic> xjson) {
    id = xjson['_id'];
    idUser = xjson['idUser'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
      };
  Barbeiro.toMap(Map<String, dynamic> map) {
    map['_id'] = id;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
  }

  static Future<List<Barbeiro>> getData({dynamic selector}) async {
    //{'_id': data.id} selector
    try {
      List<Barbeiro> data = <Barbeiro>[];
      var collection = bacon.bk.collection('Barbeiro');
      await collection.find(selector).forEach((element) {
        data.add(Barbeiro.fromJson(element));
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
