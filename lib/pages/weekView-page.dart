import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/controller/dayView-controller.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/pages/addEvento-page.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

class WeekView extends StatefulWidget {
  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  TimetableController<BasicEvent> _controllerW;

  @override
  void initState() {
    super.initState();
    Customfunctions.atualizaListaWeekView();
    _controllerW = TimetableController(
      eventProvider: EventProvider.list(listBasec),
      initialTimeRange: InitialTimeRange.range(
        startTime: LocalTime(retornaHoraMenos(), 0, 0),
        endTime: LocalTime(retornaHoraMais(), 0, 0),
      ),
      initialDate: LocalDate.today(),
      visibleRange: VisibleRange.days(7),
      firstDayOfWeek: DayOfWeek.monday,
    );
  }

  @override
  void dispose() {
    _controllerW.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        height: MediaQuery.of(context).size.height - 200,
        child: Timetable<BasicEvent>(
          theme: TimetableThemeData(
              dateIndicatorTextStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 12)),
              enablePartDayEventStacking: false,
              hourTextStyle: TextStyle(color: Colors.blue),
              dividerColor: secondary),
          controller: _controllerW,
          onEventBackgroundTap: (start, isAllDay) =>
              dialogCriaeAlteraEvent(context: context),
          eventBuilder: (event) {
            return BasicEventWidget(event,
                onTap: () => dialogCriaeAlteraEvent(context: context));
          },
        ));
  }
}
