import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/services/custom-functions.dart';

class LoginController extends GetxController {
  final db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  User userlogin = User();
  RxBool showPassword = false.obs;
  GlobalKey<FormState> formKey;
  @override
  void onInit() {
    userlogin.login = gb.box.get('login', defaultValue: '');
    userlogin.senha = gb.box.get('senha', defaultValue: '');
    super.onInit();
  }

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      userlogin.login.trim();
      userlogin.senha.trim();
      gb.loadingPadrao();
      if (await Customfunctions.verificarConexao()) {
        await db.getData(
          selector: {
            "login": userlogin.login,
            "senha": Customfunctions.textToMd5(userlogin.senha),
          },
          tabela: "User",
        ).then(
          (value) async {
            if (value.isNotEmpty) {
              gb.box.put(
                "autoLogin",
                gb.box.get(
                  'autoLogin',
                  defaultValue: true,
                ),
              );
              gb.box.put('login', userlogin.login);
              gb.box.put('senha', userlogin.senha);
              Get.offAllNamed("/home");
            } else {
              Get.back();
              Get.snackbar('Atenção', "Senha ou login invalidos",
                  duration: Duration(seconds: 1),
                  snackPosition: SnackPosition.TOP,
                  isDismissible: true,
                  dismissDirection: SnackDismissDirection.HORIZONTAL,
                  backgroundColor: Colors.white);
            }
          },
        );
      } else {
        Get.back();
        Get.snackbar('Atenção', "Sem conexão",
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            backgroundColor: Colors.white);
      }
    }
  }

  String validaCampo(value, String label) {
    if (value.isEmpty) return "Campo $label não pode ser vazio";
    return null;
  }
}
