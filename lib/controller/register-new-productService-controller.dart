import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/produtoServico.dart';

class RegisterNewProductServiceController extends GetxController {
  final db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  final formKey = GlobalKey<FormState>();
  ProdutoServico produtoServico = ProdutoServico(
    valor: 0,
  );

  Future<void> salvaAltera() async {
    if (formKey.currentState.validate()) {
      produtoServico.idUser = gb.user.id;
      await db.insertUpdate(objeto: produtoServico, tabela: "ProdutoServico").then((value) async {
        if (value != null) {
          Get.snackbar('Sucesso', "Produto/Serviço salvo com sucesso!",
              duration: Duration(seconds: 1),
              snackPosition: SnackPosition.TOP,
              isDismissible: true,
              dismissDirection: SnackDismissDirection.HORIZONTAL,
              backgroundColor: Colors.white);
        }
      });
      await carregaLista();
      await Future.delayed(Duration(seconds: 1)).then(
        (value) => Get.back(),
      );
    }
  }

  void onChangeValor(String value) {
    produtoServico.valor =
        double.tryParse(value.replaceAll('R\$ ', '').replaceAll('.', '').replaceAll(',', '.'));
  }

  Future<void> carregaLista() async {
    gb.listadeProdutoServico = [].obs;
    await db.getData(selector: {'idUser': gb.user.id}, tabela: "ProdutoServico").then((value) {
      value.forEach((element) {
        gb.listadeProdutoServico.add(
          ProdutoServico.fromJson(element),
        );
      });
    });
  }
}
