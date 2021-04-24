import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/services/custom-functions.dart';

class LoginController extends GetxController {
  final db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  User userlogin = User();
  RxBool showPassword = false.obs;
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    userlogin.login = gb.prefs.getString('login') ?? '';
    userlogin.senha = gb.prefs.getString('senha') ?? '';
    super.onInit();
  }

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      gb.loadingPadrao();
      await Customfunctions.verificarConexao().then((value) async {
        if (value && value != null) {
          await db.getData(
            selector: {
              "login": userlogin.login,
              "senha": Customfunctions.textToMd5(userlogin.senha),
            },
            tabela: "User",
          ).then((value) async {
            if (value.isNotEmpty) {
              gb.prefs.setString('login', userlogin.login);
              gb.prefs.setString('senha', userlogin.senha);
              gb.user = User.fromJson(value.first);
              await db.getData(
                selector: {'idUser': gb.user.id},
                tabela: 'Agendamento',
              ).then((value) {
                value.forEach((element) {
                  gb.listAgenda.add(Agendamento.fromJson(element));
                });
              });
              Get.offAllNamed("/home");
            } else {
              Get.snackbar('Atenção', "Senha ou login invalidos",
                  duration: Duration(seconds: 1),
                  snackPosition: SnackPosition.TOP,
                  isDismissible: true,
                  dismissDirection: SnackDismissDirection.HORIZONTAL,
                  backgroundColor: Colors.white);
            }
          });
        }
      });
      if (Get.isDialogOpen) {
        Timer(Duration(seconds: 1), () => Get.back());
      }
    }
  }

  String validaCampo(value, String label) {
    if (value.isEmpty) return "Campo $label não pode ser vazio";
    return null;
  }
}
