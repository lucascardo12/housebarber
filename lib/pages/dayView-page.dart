import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/controller/dayView-controller.dart';
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

  @override
  void initState() {
    super.initState();
    Customfunctions.atualizaListaDayView();
    _controller = TimetableController(
      eventProvider: EventProvider.list(listBasec),
      initialTimeRange: InitialTimeRange.range(
<<<<<<< Updated upstream
        startTime: LocalTime(retornaHoraMenos(), 0, 0),
        endTime: LocalTime(DateTime.now().hour + 6, 0, 0),
=======
        startTime: LocalTime(DateTime.now().hour - 1, 0, 0),
        endTime: LocalTime(DateTime.now().hour + 2, 0, 0),
>>>>>>> Stashed changes
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
        height: MediaQuery.of(context).size.height - 200,
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
