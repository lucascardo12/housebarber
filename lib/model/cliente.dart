import 'package:housebarber/config/banco.dart';
import 'package:housebarber/config/global.dart';

class Cliente {
  String idUser;
  String idCliente;
  String nome;
  String numero;
  String cpf;
  String email;

  Cliente(
      {String idUser,
      String idCliente,
      String nome,
      String numero,
      String cpf,
      String email,
      String senha}) {
    this.idUser = idUser;
    this.idCliente = idCliente;
    this.numero = numero;
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
  }
  Cliente.fromJson(Map<String, dynamic> xjson) {
    idUser = xjson['idUser'];
    idCliente = xjson['_id'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        '_id': idCliente,
        'nome': nome,
        'numero': numero,
        'email': email,
        'cpf': cpf
      };
  Cliente.toMap(Map<String, dynamic> map) {
    map['idUser'] = idUser;
    map['_id'] = idCliente;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }
  // static Future<List<Cliente>> getClientes({String idUser}) async {
  //   var collection = bacon.bk.collection('cliente');
  //   var ret = collection.find({"idUser": idUser});
  //   List<dynamic> lista = ret.map((e) => Cliente.fromJson(e)).toList();
  //   return lista;
  // }
}
