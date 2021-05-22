import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/services/custom-functions.dart';
import 'package:housebarber/widgets/button-padrao.dart';

class LoginController extends GetxController {
  final db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  User userlogin = User();
  RxBool showPassword = false.obs;
  GlobalKey<FormState> formKey;
  @override
  void onInit() {
    userlogin.login = gb.prefs.getString('login') ?? '';
    userlogin.senha = gb.prefs.getString('senha') ?? '';
    super.onInit();
  }

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      userlogin.login.trim();
      userlogin.senha.trim();
      await Customfunctions.verificarConexao().then(
        (value) async {
          if (value && value != null) {
            await db.getData(
              selector: {
                "login": userlogin.login,
                "senha": Customfunctions.textToMd5(userlogin.senha),
              },
              tabela: "User",
            ).then(
              (value) async {
                if (value.isNotEmpty) {
                  gb.prefs.setString('login', userlogin.login);
                  gb.prefs.setString('senha', userlogin.senha);
                  gb.user = User.fromJson(value.first);
                  if (verificaPagamento()) {
                    gb.loadingPadrao();
                    await carregaListas();
                    Get.offAllNamed("/home");
                  } else {
                    Get.defaultDialog(
                        title: 'Atenção! ',
                        confirm: ButtonPadrao(
                          label: 'Ok',
                          onPressed: () => Get.back(),
                        ),
                        content: Text("Pagamento da mensalidade não identificado"));
                  }
                } else {
                  Get.snackbar('Atenção', "Senha ou login invalidos",
                      duration: Duration(seconds: 1),
                      snackPosition: SnackPosition.TOP,
                      isDismissible: true,
                      dismissDirection: SnackDismissDirection.HORIZONTAL,
                      backgroundColor: Colors.white);
                }
              },
            );
          }
        },
      );
    }
  }

  Future<void> carregaListas() async {
    await db.getData(selector: {'idUser': gb.user.id}, tabela: "ProdutoServico").then((value) {
      value.forEach((element) {
        gb.listadeProdutoServico.add(
          ProdutoServico.fromJson(element),
        );
      });
    });
    await db.getData(selector: {'idUser': gb.user.id}, tabela: "Cliente").then((value) {
      value.forEach((element) {
        gb.listadeCliente.add(
          Cliente.fromJson(element),
        );
      });
    });

    await db.getData(
      selector: {'idUser': gb.user.id},
      tabela: 'Agendamento',
    ).then(
      (value) {
        value.forEach(
          (element) {
            gb.listAgenda.add(Agendamento.fromJson(element));
          },
        );
      },
    );
  }

  String validaCampo(value, String label) {
    if (value.isEmpty) return "Campo $label não pode ser vazio";
    return null;
  }

  bool verificaPagamento() {
    if (gb.user.dtPagamento == null) return true;
    Duration dif = gb.user.dtPagamento.difference(DateTime.now());
    if ((dif.inDays * -1) >= 31) return false;
    return true;
  }
}
