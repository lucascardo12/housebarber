import 'package:get/get.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/pages/cadastros/addEvento-page.dart';
import 'package:housebarber/services/global.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DayViewController extends GetxController {
  CalendarController controller;
  final gb = Get.find<Global>();
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

  void openCadastro() {
    Agendamento agenda = Agendamento();
    DateTime data = controller.selectedDate;
    if (data != null) {
      agenda = Agendamento(
        startTime: data,
        data: data.subtract(
          Duration(
            hours: data.hour,
          ),
        ),
      );
    }
    Get.bottomSheet(
      AddEventoPage(
        agenda: agenda,
      ),
    );
  }

  void openAgendamento(CalendarTapDetails details) {
    if (details.appointments != null && details.targetElement.toString() == 'CalendarElement.appointment') {
      Get.bottomSheet(
        AddEventoPage(
          agenda: details.appointments.first,
        ),
      );
    }
  }
}
