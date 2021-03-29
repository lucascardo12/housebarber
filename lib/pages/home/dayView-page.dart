import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/pages/cadastros/addEvento-page.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
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
      height: MediaQuery.of(context).size.height * 0.90,
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
                await dialogCriaeAlteraEvent(
                    context: context,
                    horaIni: _controller.selectedDate.hour,
                    dataMarcada: _controller.selectedDate);
                setState(() {
                  print('test');
                });
              },
              color: Colors.blue,
              iconSize: 38,
            )),
        body: SfCalendar(
          controller: _controller,
          onTap: (calendarTapDetails) async {
            if (calendarTapDetails.appointments != null) {
              await dialogCriaeAlteraEvent(
                context: context,
                evento: calendarTapDetails.appointments.first,
              ).then((value) => setState(() {}));
            }
          },
          dataSource: AgendamentoDataSource(listAgenda),
          showNavigationArrow: true,
          headerStyle: CalendarHeaderStyle(
              textStyle: TextStyle(color: Colors.white, fontSize: 20)),
          backgroundColor: primaryLight,
          timeSlotViewSettings: TimeSlotViewSettings(
              timeFormat: 'H',
              timeTextStyle: TextStyle(color: secondary, fontSize: 14)),
          view: CalendarView.day,
          cellBorderColor: secondary,
          viewHeaderStyle: ViewHeaderStyle(
              dayTextStyle: TextStyle(color: Colors.white, fontSize: 12)),
          appointmentBuilder: (
            BuildContext context,
            CalendarAppointmentDetails details,
          ) {
            final Agendamento agenda = details.appointments.first;
            Cliente cliente;
            Cliente.getData(selector: {'_id': int.parse(agenda.idCliente)})
                .then((value) => cliente = value.first);
            print(cliente.nome);
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: secondary,
              ),
              child: Center(
                child: Text(
                  (cliente != null
                          ? cliente.nome != null
                              ? cliente.nome
                              : ''
                          : "") +
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
