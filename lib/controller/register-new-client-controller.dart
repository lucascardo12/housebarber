import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/cliente.dart';

class RegisterNewClientServiceController extends GetxController {
  final db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  final formKey = GlobalKey<FormState>();
  Cliente cliente = Cliente();

  Future<void> salvaAltera() async {
    if (formKey.currentState.validate()) {
      cliente.idUser = gb.user.id;
      await db.insertUpdate(objeto: cliente, tabela: "Cliente").then((value) async {
        if (value != null) {
          int index = gb.listadeCliente.indexOf(cliente);
          if (index < 0) {
            gb.listadeCliente.add(cliente);
            await Future.delayed(Duration(seconds: 1)).then(
              (value) => Get.back(),
            );
          } else {
            gb.listadeCliente[gb.listadeCliente.indexOf(cliente)] = cliente;
            Get.back();
          }
          Get.snackbar('Sucesso', "Cliente salvo com sucesso!",
              duration: Duration(seconds: 1),
              snackPosition: SnackPosition.TOP,
              isDismissible: true,
              dismissDirection: SnackDismissDirection.HORIZONTAL,
              backgroundColor: Colors.white);
        }
      });
    }
  }

  Future<void> deleta({Cliente cliente}) async {
    gb.loadingPadrao();
    await db.delete(objeto: cliente, tabela: "Cliente").then((value) async {
      if (value != null) {
        Get.snackbar('Sucesso', "Cliente deletado com sucesso!",
            duration: Duration(seconds: 1),
            snackPosition: SnackPosition.TOP,
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            backgroundColor: Colors.white);
      }
    });
    gb.listadeCliente.remove(cliente);
    await Future.delayed(Duration(seconds: 1)).then(
      (value) => Get.back(),
    );
  }

  String validaCampo(value, String label) {
    if (value.isEmpty) return "Campo $label não pode ser vazio";
    return null;
  }

  String validaEmail(value) {
    if (value.isEmpty) return "Campo E-mail não pode ser vazio";
    if (!GetUtils.isEmail(value)) return "O E-mail informado não é valido";
    return null;
  }

  String validaCpfCnpj(String value) {
    if (value.isEmpty) return "Campo CPF/CNPJ não pode ser vazio";
    if (value.length > 14) {
      if (!GetUtils.isCnpj(value)) return "O CNPJ informado não é valido";
    } else {
      if (!GetUtils.isCpf(value)) return "O CPF informado não é valido";
    }

    return null;
  }
}
