import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  TimetableController<BasicEvent> _controller;
  List<BasicEvent> listBasec = new List<BasicEvent>();
  @override
  void initState() {
    super.initState();
    for (Agendamento item in listAgenda) {
      BasicEvent auxi = new BasicEvent(
          id: item.id + 1,
          title: item.title ?? 'fdgsdfg',
          color: secondary,
          start: LocalDate.dateTime(Customfunctions.dataString(data: item.dia)).at(LocalTime(
              int.parse(
                  item.horaInicio.substring(0, item.horaInicio.indexOf(':'))),
              int.parse(item.horaInicio.substring(
                  item.horaInicio.indexOf(':') + 1, item.horaInicio.length)),
              0)),
          end: LocalDate.dateTime(Customfunctions.dataString(data: item.dia)).at(LocalTime(
              int.parse(item.horaFim.substring(0, item.horaFim.indexOf(':'))),
              int.parse(item.horaFim.substring(
                  item.horaFim.indexOf(':') + 1, item.horaFim.length)),
              0)));
      listBasec.add(auxi);
    }
    _controller = TimetableController(
      eventProvider: EventProvider.list(listBasec),
      initialTimeRange: InitialTimeRange.range(
        startTime: LocalTime(0, 0, 0),
        endTime: LocalTime(23, 0, 0),
      ),
      initialDate: LocalDate.today(),
      visibleRange: VisibleRange.days(1),
      firstDayOfWeek: DayOfWeek.monday,
    );
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
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height / 10,
        child: Timetable<BasicEvent>(
          theme: TimetableThemeData(
              hourTextStyle: TextStyle(color: Colors.blue),
              dividerColor: secondary),
          controller: _controller,
          onEventBackgroundTap: (start, isAllDay) {},
          eventBuilder: (event) {
            return BasicEventWidget(
              event,
              onTap: () => showEvent(),
            );
          },
        ));
  }

  showEvent() {}
}
