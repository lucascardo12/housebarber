import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/cliente.dart';

cadastraCliente({var infoArray, BuildContext context}) async {
  Cliente cliente = new Cliente(
      nome: infoArray['nome'],
      numero: infoArray['numero'],
      email: infoArray['email'],
      cpf: infoArray['cpf'],
      idUser: infoArray['idUser']);

  await bacon.insertUpdate(objeto: cliente, tabela: "Cliente").then((value) {
    if (value != null) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Success,
          androidToast: "Cliente Cadastrado com Sucesso",
          toastDuration: 6,
          toastShowIcon: true);
      Navigator.pushNamed(context, '/newRegisters');
    }
  });
}
