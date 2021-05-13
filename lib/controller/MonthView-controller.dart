import 'package:get/get.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/services/global.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthViewController extends GetxController {
  final gb = Get.find<Global>();
  CalendarController controller;
  @override
  void onInit() {
    controller = CalendarController();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String retornaTitulo(Agendamento agenda) {
    return gb.listadeProdutoServico
            .firstWhere(
              (element) => element.id == agenda.idServico,
            )
            .nome +
        ' - ' +
        gb.listadeCliente
            .firstWhere(
              (element) => element.id == agenda.idCliente,
            )
            .nome +
        ' - ' +
        DateFormat('kk:mm').format(agenda.startTime) +
        ' - ' +
        DateFormat('kk:mm').format(agenda.endTime);
  }
}
