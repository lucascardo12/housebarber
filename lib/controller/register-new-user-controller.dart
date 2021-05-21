import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/custom-functions.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/user.dart';

class RegisterNewUserController extends GetxController {
  final db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  User userRegister = User();
  RxBool showPassword = false.obs;
  GlobalKey<FormState> formKey;
  @override
  void onClose() {
    super.onClose();
  }

  Future<void> cadastro() async {
    if (formKey.currentState.validate()) {
      userRegister.senha.trim();
      userRegister.login.trim();
      userRegister.senha = Customfunctions.textToMd5(userRegister.senha);
      gb.loadingPadrao();
      await Customfunctions.verificarConexao().then((value) async {
        if (value && value != null) {
          await db.getData(
            selector: {"login": userRegister.login},
            tabela: "User",
          ).then((value) async {
            if (value == null || value.isEmpty) {
              await db.insertUpdate(tabela: 'User', objeto: userRegister);
              Get.offAllNamed("/login");
            } else {
              Get.snackbar('Atenção', "Usuario já Cadastrado",
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

  String validaEmail(value) {
    if (value.isEmpty) return "Campo E-mail não pode ser vazio";
    if (!GetUtils.isEmail(value)) return "O E-mail informado não é valido";
    return null;
  }

  String validaCpfCnpj(String value) {
    if (value.isEmpty) return "Campo CPF/CNPJ não pode ser vazio";
    if (value.length > 14) {
      if (!GetUtils.isCnpj(value)) return "O CNPJ informado não é valido";
    } else {
      if (!GetUtils.isCpf(value)) return "O CPF informado não é valido";
    }

    return null;
  }
}
