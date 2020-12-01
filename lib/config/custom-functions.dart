import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/pages/home-page-cliente.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/funcionario.dart';
import 'package:housebarber/model/user.dart';

class Customfunctions {
  static validaLogin({var infoArray, BuildContext context}) async {
    var login = infoArray["login"];
    var senha = infoArray["senha"];
    var mensagem = "";

    if (login == "") {
      mensagem += "O Login é Obrigatório";
    }
    if (senha == "") {
      mensagem += "A Senha é Obrigatória";
    }
    if (mensagem == "") {
      await bacon.getUser(infoArray: infoArray).then((value) {
        if (value != null) {
          var tpuser = value["tipoUser"];
          if (tpuser == '1') {
            //EMPRESA
            Navigator.pushReplacementNamed(context, "/home");
            print('EMPRESA');
          } else if (tpuser == '2') {
            //FUNCIONARIO
            print('FUNCIONARIO');
          } else if (tpuser == '3') {
            //CLIENTE
            print('CLIENTE');
          }
        } else {
          //USUARIO NÃO ENCONTRADO
        }
      });
    } else {
      //retorno msg para a tela do usuario
    }
  }

  static validaCadastro({var infoArray}) {
    var nome = infoArray["nome"];
    var usuario = infoArray["usuario"];
    var senha = infoArray["senha"];
    var numero = infoArray["numero"];
    var cnpj = infoArray["cpfcnpj"];
    var email = infoArray["email"];
    var tipoUser = infoArray["tipoUser"];
    var mensagem = "";
    if (nome == "") {
      mensagem += "Nome é Obrigatório";
    }
    if (numero == "") {
      mensagem += "numero é Obrigatório";
    }
    if (cnpj == "") {
      mensagem += "cnpj é Obrigatório";
    }
    if (email == "") {
      mensagem += "email é Obrigatório";
    }
    if (usuario == "") {
      mensagem += "usuario é Obrigatório";
    }
    if (senha == "") {
      mensagem += "senha é Obrigatório";
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
      //Retorna mensagem para tela de usuario.
    }
  }

  static cadastraEmpresa({var infoArray}) async {
    User user = new User(
        login: infoArray['usuario'],
        senha: infoArray['senha'],
        tipoUser: infoArray['tipoUser']);

    await bacon.alteraUser(user: user).then((value) {
      if (value != null) {
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
      if (value != null) {
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
