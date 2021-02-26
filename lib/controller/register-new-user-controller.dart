import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/user.dart';

Future<void> validaCadastro({var infoArray, BuildContext context}) async {
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
    await User.getData(selector: {"login": usuario}).then((value) {
      if (value == null || value.isEmpty) {
        bacon.insertUpdate(
            tabela: 'User',
            objeto: User(
              login: usuario,
              senha: senha,
              cnpj: cnpj,
              email: email,
              nome: nome,
              numero: numero,
            ));
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
