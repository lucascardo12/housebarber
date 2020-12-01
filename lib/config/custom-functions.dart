import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/funcionario.dart';
import 'package:housebarber/model/user.dart';

class Customfunctions {
  static validaCadastro({var infoArray}) {
    print(infoArray);
    var nome = infoArray["nome"];
    var usuario = infoArray["usuario"];
    var senha = infoArray["senha"];
    var numero = infoArray["numero"];
    var cnpj = infoArray["cpfcnpj"];
    var email = infoArray["email"];
    var tipoUser = infoArray["tipoUser"];
    var mensagem = "";
    if (nome == "") {
      mensagem += "Nome é Obrigatório\n";
    }
    if (numero == "") {
      mensagem += "numero é Obrigatório\n";
    }
    if (cnpj == "") {
      mensagem += "cnpj é Obrigatório\n";
    }

    if (usuario == "") {
      mensagem += "usuario é Obrigatório\n";
    }
    if (senha == "") {
      mensagem += "senha é Obrigatório\n";
    }
    if (email == "") {
      mensagem += "email é Obrigatório";
    }
    if (mensagem == "") {
      if (tipoUser == "1") {
        //EMPRESA
        cadastraEmpresa(infoArray: infoArray);
      } else if (tipoUser == "2") {
        //FUNCIONARIO
        cadastraFuncionario(infoArray: infoArray);
      } else if (tipoUser == "3") {
        //CLIENTE
        cadastraCliente(infoArray: infoArray);
      }
    } else {
      Fluttertoast.showToast(
          msg: mensagem,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 8,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }

  static cadastraEmpresa({var infoArray}) async {
    User user = new User(
        login: infoArray['usuario'],
        senha: infoArray['senha'],
        tipoUser: infoArray['tipoUser']);

    await bacon.alteraUser(user: user).then((value) {
      if (value.idUser != null) {
        Empresa empresa = new Empresa(
            nome: infoArray['nome'],
            numero: infoArray['numero'],
            idUser: value.idUser,
            cnpj: infoArray['cpfcnpj'],
            email: infoArray['email']);

        bacon.alteraEmpresa(empresa: empresa);
      }
    });
  }

  static cadastraFuncionario({var infoArray}) async {
    User user = new User(
        login: infoArray['usuario'],
        senha: infoArray['senha'],
        tipoUser: infoArray['tipoUser']);

    await bacon.alteraUser(user: user).then((value) {
      if (value.idUser != null) {
        Funcionario funcionario = new Funcionario(
            nome: infoArray['nome'],
            numero: infoArray['numero'],
            idUser: value.idUser,
            cpf: infoArray['cpfcnpj'],
            email: infoArray['email']);

        bacon.alteraFuncionario(funcionario: funcionario);
      }
    });
  }

  static cadastraCliente({var infoArray}) async {
    User user = new User(
        login: infoArray['usuario'],
        senha: infoArray['senha'],
        tipoUser: infoArray['tipoUser']);

    await bacon.alteraUser(user: user).then((value) {
      if (value != null) {
        Cliente cliente = new Cliente(
            nome: infoArray['nome'],
            numero: infoArray['numero'],
            idUser: value.idUser,
            cpf: infoArray['cpfcnpj'],
            email: infoArray['email']);

        bacon.alteraCliente(cliente: cliente);
      }
    });
  }

  static String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
