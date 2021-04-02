import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/user.dart';

Future<void> validaLogin({var infoArray, BuildContext context}) async {
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
    await User.getData(selector: {"login": login, "senha": senha}).then((value) async {
      if (value.isNotEmpty) {
        prefs.setString('login', login);
        prefs.setString('senha', infoArray["senha"]);
        user = value.first;
        await Agendamento.getData(selector: {'idUser': user.id}).then((value) => listAgenda = value);
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        EasyLoading.showError(
          "Usuario ou Senha Inválido",
        );
      }
    });
  } else {
    EasyLoading.showError(
      mensagem,
    );
  }
}
