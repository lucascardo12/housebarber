import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';
import 'package:housebarber/services/custom-functions.dart';
import 'package:housebarber/services/global.dart';

// Não me orgulho desse controller mas é a vida nem tudo pode ser perfeito
class AddEventoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final gb = Get.find<Global>();
  final db = Get.find<MongoDB>();
  Agendamento agendamento = Agendamento();
  Cliente selectCliente;
  ProdutoServico selectProduto;
  TextEditingController dataControl = TextEditingController();
  TextEditingController inicioControl = TextEditingController();
  TextEditingController fimControl = TextEditingController();
  void inicia() {
    selectProduto = null;
    selectCliente = null;
    inicioControl.text = "";
    dataControl.text = '';
    fimControl.text = '';
    if (agendamento.startTime != null) {
      dataControl.text = Customfunctions.stringData(
        agendamento.startTime,
      );
    }
    if (agendamento.startTime != null && agendamento.startTime.hour != 0) {
      inicioControl.text = Customfunctions.stringHora(
        TimeOfDay(
          hour: agendamento.startTime.hour,
          minute: agendamento.startTime.minute,
        ),
      );
    }
    if (agendamento.endTime != null) {
      fimControl.text = Customfunctions.stringHora(
        TimeOfDay(
          hour: agendamento.endTime.hour,
          minute: agendamento.endTime.minute,
        ),
      );
    }

    if (agendamento.id != null) {
      db.getData(
        tabela: 'Cliente',
        selector: {"_id": agendamento.idCliente},
      ).then(
        (value) => selectCliente = Cliente.fromJson(
          value.first,
        ),
      );
      db.getData(
        tabela: 'ProdutoServico',
        selector: {"_id": agendamento.idServico},
      ).then(
        (value) => selectProduto = ProdutoServico.fromJson(
          value.first,
        ),
      );
    }
  }

  Future<void> salvar() async {
    if (formKey.currentState.validate() &&
        selectProduto != null &&
        selectCliente != null) {
      Get.back();
      gb.loadingPadrao();
      agendamento.idUser = gb.user.id;
      agendamento.idCliente = selectCliente.id;
      agendamento.idServico = selectProduto.id;
      agendamento.startTime =
          Customfunctions.dataStringHora(inicioControl.text);
      agendamento.endTime = Customfunctions.dataStringHora(fimControl.text);
      await Customfunctions.verificarConexao().then(
        (value) async {
          if (value && value != null) {
            await db.insertUpdate(tabela: 'Agendamento', objeto: agendamento);

            if (agendamento.id == null) {
              gb.listAgenda.add(agendamento);
            } else {
              gb.listAgenda[gb.listAgenda.indexOf(agendamento)] = agendamento;
              Get.back();
            }

            Get.snackbar('Sucesso', "Agendamento salvo",
                duration: Duration(seconds: 2),
                snackPosition: SnackPosition.TOP,
                isDismissible: true,
                dismissDirection: SnackDismissDirection.HORIZONTAL,
                backgroundColor: Colors.white);
          }
        },
      );
      Timer(Duration(seconds: 2),
          () => Get.back()); // 2 é para fechar o bottosheet
    } else {
      Get.snackbar('Atenção', "Um ou mais campos vazios",
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          isDismissible: true,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          backgroundColor: Colors.white);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<String> addDataTime({bool date = true}) async {
    if (date)
      return Customfunctions.stringData(await showDate(context: Get.context));
    return Customfunctions.stringHora(await showTime(context: Get.context));
  }

  Future<DateTime> showDate({BuildContext context}) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
  }

  Future<TimeOfDay> showTime({BuildContext context}) async {
    return await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        });
  }
}
