import 'package:housebarber/model/user.dart';

class Cliente {
  int idCliente;
  User idUser;
  String nome;
  String numero;
  String cpf;
  String email;

  Cliente(
      {int idCliente,
      User idUser,
      String nome,
      String numero,
      String cpf,
      String email,
      String senha}) {
    this.idCliente = idCliente;
    this.idUser = idUser;
    this.numero = numero;
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
  }
  Cliente.fromJson(Map<String, dynamic> xjson) {
    idCliente = xjson['_id'];
    idUser = User.fromJson(xjson['idUser']);
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() => {
        '_id': idCliente,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
        'cpf': cpf
      };
  Cliente.toMap(Map<String, dynamic> map) {
    map['_id'] = idCliente;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }
}
