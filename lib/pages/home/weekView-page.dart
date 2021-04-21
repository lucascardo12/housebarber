import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/pages/cadastros/addEvento-page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WeekView extends GetView {
  final gb = Get.find<Global>();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: gb.primaryLight,
        height: MediaQuery.of(context).size.height * 0.90,
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
                  onPressed: () async {
                    // await dialogCriaeAlteraEvent(context: context);
                    // setState(() {
                    //   print('test');
                    // });
                  },
                  color: Colors.blue,
                  iconSize: 38,
                )),
            body: SfCalendar(
                onTap: (calendarTapDetails) async {
                  // if (calendarTapDetails.appointments != null) {
                  //   await dialogCriaeAlteraEvent(
                  //           context: context, evento: calendarTapDetails.appointments.first)
                  //       .then((value) => setState(() {}));
                  // }
                },
                dataSource: AgendamentoDataSource(gb.listAgenda),
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
                view: CalendarView.week,
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: gb.secondary,
                      ),
                      child: Center(
                          child: Text(
                        agenda.idCliente.toString(),
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
