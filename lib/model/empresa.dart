import 'package:housebarber/config/global.dart';

class Empresa {
  int id;
  int idUser;
  String nome;
  String numero;
  String cnpj;
  String email;
  String fornecedor;

  Empresa({
    this.id,
    this.idUser,
    this.numero,
    this.nome,
    this.email,
    this.cnpj,
  });

  Empresa.fromJson(Map<String, dynamic> xjson) {
    id = xjson['_id'];
    idUser = xjson['idUser'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cnpj = xjson['cnpj'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
        'cnpj': cnpj
      };
  Empresa.toMap(Map<String, dynamic> map) {
    map['_id'] = id;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['cnpj'] = cnpj;
  }

  static Future<List<Empresa>> getData({dynamic selector}) async {
    //{'_id': data.id} selector
    try {
      List<Empresa> data = <Empresa>[];
      var collection = bacon.bk.collection('Empresa');
      await collection.find(selector).forEach((element) {
        data.add(Empresa.fromJson(element));
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
