import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/produtoServico.dart';

class RegisterNewProductServiceController extends GetxController {
  final db = Get.find<MongoDB>();
  cadastraProdutoServico({var infoArray, BuildContext context}) async {
    ProdutoServico produtoServico = new ProdutoServico(
        nome: infoArray['nome'], valor: double.tryParse(infoArray['valor']), idUser: infoArray['idUser']);

    await db.insertUpdate(objeto: produtoServico, tabela: "ProdutoServico").then(
      (value) {
        if (value != null) {
          // EasyLoading.showSuccess(
          //   "Produto/Serviço Cadastrado com Sucesso",
          // );

          Get.back();
        } else {
          // EasyLoading.showError(
          //   "Erro desconhecido!",
          // );
        }
      },
    );
  }

  Future<void> excluirProdutoServico({var infoArray, BuildContext context}) async {
    ProdutoServico produtoServico = ProdutoServico(id: infoArray['_id'], idUser: infoArray['idUser']);
    await db.delete(objeto: produtoServico, tabela: "ProdutoServico").then(
      (value) {
        if (value != null) {
          // EasyLoading.showSuccess(
          //   "Produto/Serviço Excluido com Sucesso",
          // );
        } else {
          // EasyLoading.showError(
          //   "Falha ao Tentar Excluir o Produto/Serviço, Favor Tentar Novamente",
          // );
        }
      },
    );
  }
}
