import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/cliente.dart';

cadastraCliente({var infoArray, BuildContext context}) async {
  Cliente cliente = new Cliente(
    nome: infoArray['nome'],
    cpf: infoArray['cpf'],
    email: infoArray['email'],
    numero: infoArray['numero'],
    idUser: infoArray['idUser'],
  );

  await bacon.insertUpdate(objeto: cliente, tabela: "Cliente").then(
    (value) {
      if (value != null) {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            androidToast: "Cliente Cadastrado com Sucesso",
            toastDuration: 10,
            toastShowIcon: true);
        Navigator.pop(context);
      } else {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Error,
            androidToast: "Erro ao Cadastrar o Cliente!",
            toastDuration: 10,
            toastShowIcon: true);
      }
    },
  );
}

Future<void> excluirCliente({var infoArray, BuildContext context}) async {
  Cliente cliente = Cliente(id: infoArray['_id'], idUser: infoArray['idUser']);
  await bacon.delete(objeto: cliente, tabela: "Cliente").then(
    (value) {
      if (value != null) {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            androidToast: "Cliente Excluido com Sucesso.",
            toastDuration: 10,
            toastShowIcon: true);
      } else {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Error,
            androidToast:
                "Falha ao Tentar Excluir o Cliente, Favor Tentar Novamente",
            toastDuration: 10,
            toastShowIcon: true);
      }
    },
  );
}
