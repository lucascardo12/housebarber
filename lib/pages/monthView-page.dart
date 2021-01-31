import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/pages/addEvento-page.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthView extends StatefulWidget {
  @override
  _MonthViewState createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  CalendarController _controller;
  @override
  void initState() {
    _controller = CalendarController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        height: MediaQuery.of(context).size.height * 0.80,
        child: Scaffold(
            floatingActionButton: Card(
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: secondary,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await dialogCriaeAlteraEvent(context: context);
                    setState(() {
                      print('test');
                    });
                  },
                  color: Colors.blue,
                  iconSize: 38,
                )),
            body: SfCalendar(
                onTap: (CalendarTapDetails details) async {
                  print(details.targetElement.toString());
                  if (details.appointments != null &&
                      details.targetElement.toString() ==
                          'CalendarElement.appointment') {
                    await dialogCriaeAlteraEvent(
                            context: context,
                            evento: details.appointments.first)
                        .then((value) => setState(() {}));
                  }
                },
                monthViewSettings: MonthViewSettings(
                    showAgenda: true,
                    monthCellStyle: MonthCellStyle(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 14))),
                dataSource: AgendamentoDataSource(listAgenda),
                showNavigationArrow: true,
                headerStyle: CalendarHeaderStyle(
                    textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                backgroundColor: primaryLight,
                timeSlotViewSettings: TimeSlotViewSettings(
                    timeFormat: 'H',
                    timeTextStyle: TextStyle(color: secondary, fontSize: 14)),
                view: CalendarView.month,
                cellBorderColor: secondary,
                viewHeaderStyle: ViewHeaderStyle(
                    dayTextStyle: TextStyle(color: Colors.white, fontSize: 12)),
                appointmentBuilder: (
                  BuildContext context,
                  CalendarAppointmentDetails details,
                ) {
                  final Agendamento agenda = details.appointments.first;
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: secondary,
                      ),
                      child: Center(
                          child: Text(
                        agenda.idCliente +
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
