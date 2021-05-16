import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';
import 'package:housebarber/services/custom-functions.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/mensagem-confirmar.dart';

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
        agendamento.data,
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
      selectCliente = gb.listadeCliente
          .where(
            (element) => element.id == agendamento.idCliente,
          )
          .first;
      selectProduto = gb.listadeProdutoServico
          .where(
            (element) => element.id == agendamento.idServico,
          )
          .first;
    }
  }

  Future<void> salvar() async {
    if (formKey.currentState.validate() &&
        selectProduto != null &&
        selectCliente != null) {
      agendamento.idUser = gb.user.id;
      agendamento.data = Customfunctions.dataString(data: dataControl.text);
      agendamento.idCliente = selectCliente.id;
      agendamento.idServico = selectProduto.id;
      agendamento.startTime =
          Customfunctions.dataStringHora(inicioControl.text);
      agendamento.endTime = Customfunctions.dataStringHora(fimControl.text);

      agendamento.startTime =
          ajustaDatas(data: agendamento.data, hora: agendamento.startTime);

      agendamento.endTime =
          ajustaDatas(data: agendamento.data, hora: agendamento.endTime);

      if (validaHoras()) {
        await Customfunctions.verificarConexao().then(
          (value) async {
            Get.back();
            gb.loadingPadrao();

            if (value && value != null) {
              await db.insertUpdate(tabela: 'Agendamento', objeto: agendamento);
              int index =
                  gb.listAgenda.indexWhere((v) => v.id == agendamento.id);
              if (index <= 0) {
                gb.listAgenda.add(agendamento);
                Get.back();
              } else {
                gb.listAgenda[gb.listAgenda
                    .indexWhere((v) => v.id == agendamento.id)] = agendamento;
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
        Get.snackbar(
            'Atenção', "Hora Incial Não Pode Ser Maior ou Igual Hora Fim",
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            backgroundColor: Colors.white);
      }
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
    if (date) return Customfunctions.stringData(await showDate());
    return Customfunctions.stringHora(await showTime());
  }

  DateTime ajustaDatas({DateTime data, DateTime hora}) {
    return DateTime(
        data.year, data.month, data.day, hora.hour, hora.minute, hora.second);
  }

  Future<DateTime> showDate() async {
    return await showDatePicker(
      context: Get.context,
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

  Future<TimeOfDay> showTime() async {
    return await showTimePicker(
      context: Get.context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );
  }

  Future<void> deletaEvento({Agendamento agenda}) async {
    await showConfirme(
      context: Get.context,
      label: 'Atenção',
      cancel: () => Get.back(),
      confirme: () => deleta(agenda: agenda),
    );
  }

  Future<void> deleta({Agendamento agenda}) async {
    Get.back();
    Get.back();
    gb.loadingPadrao();
    await Customfunctions.verificarConexao().then(
      (value) async {
        if (value && value != null) {
          await db.delete(objeto: agenda, tabela: 'Agendamento');
          gb.listAgenda.remove(agenda);
          Get.back();
        }
        Get.snackbar('Sucesso', "Agendamento Excluido com Sucesso",
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            isDismissible: true,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            backgroundColor: Colors.white);
      },
    );
    Timer(
        Duration(seconds: 2), () => Get.back()); // 2 é para fechar o bottosheet
  }

  bool validaHoras() {
    var inicio = agendamento.startTime.hour;
    var fim = agendamento.endTime.hour;
    if (inicio >= fim) return false;

    return true;
  }
}
