import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/produtoServico.dart';

cadastraProdutoServico({var infoArray, BuildContext context}) async {
  ProdutoServico produtoServico =
      new ProdutoServico(nome: infoArray['nome'], valor: infoArray['valor']);

  await bacon
      .insertUpdate(objeto: produtoServico, tabela: "ProdutoServico")
      .then((value) {
    if (value != null) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Success,
          androidToast: "Produto/Serviço Cadastrado com Sucesso",
          toastDuration: 6,
          toastShowIcon: true);
      Navigator.pushNamed(context, '/newProductService');
    }
  });
}
