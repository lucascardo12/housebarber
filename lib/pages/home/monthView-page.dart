import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/pages/cadastros/addEvento-page.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthViewPage extends GetView {
  final gb = Get.find<Global>();
  // CalendarController _controller;
  // @override
  // void initState() {
  //   _controller = CalendarController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: gb.primaryLight,
        height: Get.height * 0.90,
        child: Scaffold(
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
                  onPressed: () => Get.bottomSheet(AddEventoPage()),
                  // await dialogCriaeAlteraEvent(context: context);
                  // setState(() {
                  //   print('test');
                  // });

                  color: Colors.blue,
                  iconSize: 38,
                )),
            body: SfCalendar(
                onTap: (CalendarTapDetails details) async {
                  // print(details.targetElement.toString());
                  // if (details.appointments != null &&
                  //     details.targetElement.toString() == 'CalendarElement.appointment') {
                  //   await dialogCriaeAlteraEvent(context: context, evento: details.appointments.first)
                  //       .then((value) => setState(() {}));
                  // }
                },
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
                        gb.listadeCliente.firstWhere((element) => element.id == agenda.idCliente) +
                            ' das ' +
                            DateFormat('kk:mm').format(agenda.startTime) +
                            ' as ' +
                            DateFormat('kk:mm').format(agenda.endTime),
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
                })));
  }
}
