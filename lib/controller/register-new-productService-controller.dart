import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/produtoServico.dart';

cadastraProdutoServico({var infoArray, BuildContext context}) async {
  ProdutoServico produtoServico =
      new ProdutoServico(nome: infoArray['nome'], valor: infoArray['valor'], idUser: infoArray['idUser']);

  await bacon.insertUpdate(objeto: produtoServico, tabela: "ProdutoServico").then(
    (value) {
      if (value != null) {
        EasyLoading.showSuccess(
          "Produto/Serviço Cadastrado com Sucesso",
        );

        Navigator.pop(context);
      } else {
        EasyLoading.showError(
          "Erro desconhecido!",
        );
      }
    },
  );
}

Future<void> excluirProdutoServico({var infoArray, BuildContext context}) async {
  ProdutoServico produtoServico = ProdutoServico(id: infoArray['_id'], idUser: infoArray['idUser']);
  await bacon.delete(objeto: produtoServico, tabela: "ProdutoServico").then(
    (value) {
      if (value != null) {
        EasyLoading.showSuccess(
          "Produto/Serviço Excluido com Sucesso",
        );
      } else {
        EasyLoading.showError(
          "Falha ao Tentar Excluir o Produto/Serviço, Favor Tentar Novamente",
        );
      }
    },
  );
}
