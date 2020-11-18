import 'package:housebarber/model/user.dart';

class Funcionario {
  int idFuncionario;
  User idUser;
  String nome;
  String numero;
  String cpf;
  String email;

  Funcionario(
      {int idFuncionario,
      User idUser,
      String nome,
      String numero,
      String cpf,
      String email,
      String senha}) {
    this.idFuncionario = idFuncionario;
    this.idUser = idUser;
    this.numero = numero;
    this.nome = nome;
    this.email = email;
    this.cpf = cpf;
  }
  Funcionario.fromJson(Map<String, dynamic> xjson) {
    idFuncionario = xjson['_id'];
    idUser = User.fromJson(xjson['idUser']);
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() => {
        '_id': idFuncionario,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
        'cpf': cpf
      };
  Funcionario.toMap(Map<String, dynamic> map) {
    map['_id'] = idFuncionario;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }
}
