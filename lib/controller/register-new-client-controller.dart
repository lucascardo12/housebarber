import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        EasyLoading.showSuccess("Cliente Cadastrado com Sucesso", maskType: EasyLoadingMaskType.none);
        Navigator.pop(context);
      } else {
        EasyLoading.showError(
          "Erro ao Cadastrar o Cliente!",
        );
      }
    },
  );
}

Future<void> excluirCliente({var infoArray, BuildContext context}) async {
  Cliente cliente = Cliente(id: infoArray['_id'], idUser: infoArray['idUser']);
  await bacon.delete(objeto: cliente, tabela: "Cliente").then(
    (value) {
      if (value != null) {
        EasyLoading.showSuccess(
          "Cliente Excluido com Sucesso.",
        );
      } else {
        EasyLoading.showError(
          "Falha ao Tentar Excluir o Cliente, Favor Tentar Novamente",
        );
      }
    },
  );
}
