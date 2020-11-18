import 'package:housebarber/model/user.dart';

class Empresa {
  int idEmpresa;
  User idUser;
  String nome;
  String numero;
  String cnpj;
  String email;
  String fornecedor;
  List<int> listClient;
  List<int> listFunc;

  Empresa(
      {int idEmpresa,
      User idUser,
      String numero,
      String nome,
      String senha,
      String email,
      String cnpj,
      String fornecedor,
      List<int> listClient,
      List<int> listFunc}) {
    this.idEmpresa = idEmpresa;
    this.idUser = idUser;
    this.numero = numero;
    this.nome = nome;
    this.email = email;
    this.listClient = listClient;
    this.listFunc = listFunc;
  }
  Empresa.fromJson(Map<String, dynamic> xjson) {
    idEmpresa = xjson['_id'];
    idUser = User.fromJson(xjson['idUser']);
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    listClient = xjson['listClient'];
    listFunc = xjson['listFunc'];
  }

  Map<String, dynamic> toJson() => {
        '_id': idEmpresa,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
        'listClient': listClient,
        'listFunc': listFunc,
      };
  Empresa.toMap(Map<String, dynamic> map) {
    map['_id'] = idEmpresa;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['listClient'] = listClient;
    map['listFunc'] = listFunc;
  }
}
