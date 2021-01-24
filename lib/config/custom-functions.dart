import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/funcionario.dart';
import 'package:housebarber/model/user.dart';
import 'package:intl/intl.dart';

class Customfunctions {
  static Future<void> validaLogin({var infoArray, BuildContext context}) async {
    var login = infoArray["login"];
    var senha = infoArray["senha"];
    var mensagem = "";

    if (login == "") {
      mensagem += "\nPor favor, digite o login\n";
    }
    if (senha == "") {
      mensagem += "\nPor favor, digite a Senha\n";
    }
    if (mensagem == "") {
      senha = Customfunctions.textToMd5(infoArray["senha"]);
      var dadosLogin = {"login": login, "senha": senha};
      await bacon.getUser(infoArray: dadosLogin).then((value) async {
        if (value != null) {
          prefs.setString('login', login);
          prefs.setString('senha', infoArray["senha"]);
          user = value;
          await bacon.getAgendamentos().then((value) => listAgenda = value);
          Navigator.pushReplacementNamed(context, "/home");
          print('EMPRESA');
        } else {
          FlutterToastAlert.showToastAndAlert(
              type: Type.Warning,
              androidToast: "Usuario ou Senha Inválido",
              toastDuration: 6,
              toastShowIcon: false);
        }
      });
    } else {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Warning,
          androidToast: mensagem,
          toastDuration: 5,
          toastShowIcon: false);
    }
  }

  static Future<void> validaCadastro(
      {var infoArray, BuildContext context}) async {
    var nome = infoArray["nome"];
    var usuario = infoArray["usuario"];
    var senha = infoArray["senha"];
    var numero = infoArray["numero"];
    var cnpj = infoArray["cpfcnpj"];
    var email = infoArray["email"];
    var mensagem = "";
    if (nome == "") {
      mensagem += "\nNome é Obrigatório\n";
    }
    if (numero == "") {
      mensagem += "\nNumero é Obrigatório\n";
    }
    if (cnpj == "") {
      mensagem += "\nCNPJ é Obrigatório\n";
    }

    if (usuario == "") {
      mensagem += "\nUsuário é Obrigatório\n";
    }
    if (senha == "") {
      mensagem += "\nSenha é Obrigatório\n";
    }
    if (email == "") {
      mensagem += "\nE-mail é Obrigatório\n";
    }
    if (mensagem == "") {
      await bacon.existeUser(login: usuario).then((value) {
        if (value == false) {
          cadastraEmpresa(infoArray: infoArray, context: context);
        } else {
          FlutterToastAlert.showToastAndAlert(
              type: Type.Warning,
              androidToast: "Usuario já Cadastrado",
              toastDuration: 5,
              toastShowIcon: false);
        }
      });
    } else {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Warning,
          androidToast: mensagem,
          toastDuration: 5,
          toastShowIcon: false);
    }
  }

  static cadastraEmpresa({var infoArray, BuildContext context}) async {
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

        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            androidToast: "Usuario Cadastrado com Sucesso",
            toastDuration: 5,
            toastShowIcon: true);
        Navigator.pushReplacementNamed(context, "/home");
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

  static String capitalize(String palavra) {
    var up = palavra.substring(0, 1).toUpperCase();
    return palavra.replaceFirst(palavra.substring(0, 1), up);
  }

  // ignore: missing_return
  static Future<bool> verificarConexao() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Warning,
          androidToast: "Sem conexão",
          toastDuration: 5,
          toastShowIcon: true);
      return false;
    }
  }

  //converte Data para String
  static String stringData(DateTime date) {
    if (date != null) {
      final f = new DateFormat('dd/MM/yyyy');
      return f.format(date);
    } else {
      return null;
    }
  }

  static String stringHora(TimeOfDay hora) {
    if (hora != null) {
      return hora.hour.toString().padLeft(2, '0') +
          ":" +
          aredonda(hora.minute).toString().padLeft(2, '0');
    } else {
      return null;
    }
  }

  static int aredonda(int minuto) {
    if (minuto > 30) {
      return 0;
    } else {
      return 30;
    }
  }

  //converte String em data
  static DateTime dataString({@required String data}) {
    DateTime date;

    String datt = data.substring(6, 10) +
        '-' +
        data.substring(3, 5) +
        '-' +
        data.substring(0, 2);
    date = DateTime.parse(datt);

    return date;
  }
}
