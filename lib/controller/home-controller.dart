import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/utils/custom-functions.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/services/notificaion.dart';
import 'package:housebarber/widgets/button-padrao.dart';

class HomeController extends GetxController {
  final gb = Get.find<Global>();
  final db = Get.find<MongoDB>();
  final notific = Get.find<NotificFCM>();
  final User userlogin = User();
  var pag = 0.obs;

  @override
  void onInit() {
    userlogin.login = gb.box.get('login', defaultValue: '');
    userlogin.senha = gb.box.get('senha', defaultValue: '');

    logado();

    super.onInit();
  }

  Future<void> logado() async {
    if (await Customfunctions.verificarConexao()) {
      gb.loadingPadrao();
      await db.getData(
        selector: {
          "login": userlogin.login,
          "senha": Customfunctions.textToMd5(userlogin.senha),
        },
        tabela: "User",
      ).then(
        (value) async {
          gb.user = User.fromJson(value.first);
          if (verificaPagamento()) {
            await carregaListas();
            verificaToken();
            Get.back();
          } else {
            Get.offAllNamed("/login");
            Get.defaultDialog(
                title: 'Atenção! ',
                confirm: ButtonPadrao(
                  label: 'Ok',
                  onPressed: () => Get.back(),
                ),
                content: Text("Pagamento da mensalidade não identificado"));
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

  Future<void> carregaListas() async {
    gb.listadeProdutoServico.clear();
    await db.getData(
        selector: {'idUser': gb.user.id}, tabela: "ProdutoServico").then(
      (value) {
        value.forEach(
          (element) {
            gb.listadeProdutoServico.add(
              ProdutoServico.fromJson(element),
            );
          },
        );
      },
    );
    gb.listadeCliente.clear();
    await db.getData(selector: {'idUser': gb.user.id}, tabela: "Cliente").then(
      (value) {
        value.forEach(
          (element) {
            gb.listadeCliente.add(
              Cliente.fromJson(element),
            );
          },
        );
      },
    );
    gb.listAgenda.clear();
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

  bool verificaPagamento() {
    if (gb.user.dtPagamento == null) return true;
    Duration dif = gb.user.dtPagamento.difference(DateTime.now());
    if ((dif.inDays * -1) >= 31) return false;
    return true;
  }

  verificaToken() async {
    String token = gb.box.get('tokenGotify${gb.user.id}', defaultValue: '');
    if (token.isEmpty || token != gb.user.tokenFCM) {
      await notific.gettoken();
      gb.user.tokenFCM = notific.token;
      gb.box.put('tokenGotify${gb.user.id}', notific.token);
      db.insertUpdate(objeto: gb.user, tabela: 'User');
    }
  }
}
