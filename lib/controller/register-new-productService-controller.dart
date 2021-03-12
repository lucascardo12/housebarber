import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/produtoServico.dart';

cadastraProdutoServico({var infoArray, BuildContext context}) async {
  ProdutoServico produtoServico = new ProdutoServico(
      nome: infoArray['nome'],
      valor: infoArray['valor'],
      idUser: infoArray['idUser']);

  await bacon
      .insertUpdate(objeto: produtoServico, tabela: "ProdutoServico")
      .then(
    (value) {
      if (value != null) {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            androidToast: "Produto/Serviço Cadastrado com Sucesso",
            toastDuration: 10,
            toastShowIcon: true);
        Navigator.pushNamed(context, '/listaProdutoServico');
      }
    },
  );
}

excluirProdutoServico({var infoArray, BuildContext context}) async {
  ProdutoServico produtoServico =
      ProdutoServico(id: infoArray['_id'], idUser: infoArray['idUser']);
  await bacon.delete(objeto: produtoServico, tabela: "ProdutoServico").then(
    (value) {
      if (value != null) {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            androidToast: "Produto/Serviço Cadastrado com Sucesso",
            toastDuration: 10,
            toastShowIcon: true);
        Navigator.pushNamed(context, '/listaProdutoServico');
      } else {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Error,
            androidToast:
                "Falha ao Tentar Excluir o Produto/Serviço, Favor Tentar Novamente",
            toastDuration: 10,
            toastShowIcon: true);
      }
    },
  );
}
