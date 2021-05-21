import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/monthView-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthViewPage extends GetView {
  final gb = Get.find<Global>();
  final MonthViewController controller = Get.put(MonthViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: gb.secondary,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => controller.openCadastro(),
              color: Colors.blue,
              iconSize: 38,
            )),
        body: Obx(() => gb.listAgenda.length > -1
            ? SfCalendar(
                todayHighlightColor: Colors.amber,
                controller: controller.controller,
                onTap: (CalendarTapDetails details) async => controller.openAgendamento(details),
                monthViewSettings: MonthViewSettings(
                  showAgenda: true,
                  monthCellStyle: MonthCellStyle(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                dataSource: AgendamentoDataSource(gb.listAgenda),
                showNavigationArrow: true,
                headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                backgroundColor: gb.primaryLight,
                timeSlotViewSettings: TimeSlotViewSettings(
                  timeFormat: 'H',
                  timeTextStyle: TextStyle(
                    color: gb.secondary,
                    fontSize: 14,
                  ),
                ),
                view: CalendarView.month,
                cellBorderColor: gb.secondary,
                viewHeaderStyle: ViewHeaderStyle(
                  dayTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                appointmentBuilder: (
                  BuildContext context,
                  CalendarAppointmentDetails details,
                ) {
                  final Agendamento agenda = details.appointments.first;
                  return Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                        color: gb.secondary,
                      ),
                      child: Center(
                          child: Text(
                        controller.retornaTitulo(agenda),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )));
                })
            : Container()));
  }
}
