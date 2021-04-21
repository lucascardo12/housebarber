import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/cliente.dart';

class RegisterNewClientServiceController extends GetxController {
  final db = Get.find<MongoDB>();
  final formKey = GlobalKey<FormState>();
  cadastraCliente({var infoArray, BuildContext context}) async {
    Cliente cliente = new Cliente(
      nome: infoArray['nome'],
      cpf: infoArray['cpf'],
      email: infoArray['email'],
      numero: infoArray['numero'],
      idUser: infoArray['idUser'],
    );

    await db.insertUpdate(objeto: cliente, tabela: "Cliente").then(
      (value) {
        if (value != null) {
          //EasyLoading.showSuccess("Cliente Cadastrado com Sucesso", maskType: EasyLoadingMaskType.none);
          Get.back();
        } else {
          // EasyLoading.showError(
          //   "Erro ao Cadastrar o Cliente!",
          // );
        }
      },
    );
  }

  Future<void> excluirCliente({var infoArray, BuildContext context}) async {
    Cliente cliente = Cliente(id: infoArray['_id'], idUser: infoArray['idUser']);
    await db.delete(objeto: cliente, tabela: "Cliente").then(
      (value) {
        if (value != null) {
          // EasyLoading.showSuccess(
          //   "Cliente Excluido com Sucesso.",
          // );
        } else {
          // EasyLoading.showError(
          //   "Falha ao Tentar Excluir o Cliente, Favor Tentar Novamente",
          // );
        }
      },
    );
  }
}
