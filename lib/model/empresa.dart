import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/funcionario.dart';

class Empresa {
  int idEmpresa;
  int idUser;
  String nome;
  String numero;
  String cnpj;
  String email;
  String fornecedor;
  List<int> listClient;
  List<int> listFunc;

  Empresa(
      {int idEmpresa,
      int idUser,
      String numero,
      String nome,
      String senha,
      String email,
      String cnpj,
      String fornecedor,
      List<int> listClient,
      List<int> listFunc}) {
    this.numero = numero;
    this.numero = numero;
    this.numero = numero;
    this.nome = nome;
    this.email = email;
    this.listClient = listClient;
    this.listFunc = listFunc;
  }
  Empresa.fromJson(Map<String, dynamic> xjson) {
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    listClient = xjson['listClient'];
    listFunc = xjson['listFunc'];
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'numero': numero,
        'email': email,
        'listClient': listClient,
        'listFunc': listFunc,
      };
  Empresa.toMap(Map<String, dynamic> map) {
    map["nome"] = nome;
    map["numero"] = numero;
    map['email'] = email;
    map['listClient'] = listClient;
    map['listFunc'] = listFunc;
  }
}
