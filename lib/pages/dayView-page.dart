import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timetable/timetable.dart';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TimetableController<BasicEvent> _controller;

  @override
  void initState() {
    super.initState();

    _controller = TimetableController(
      eventProvider: EventProvider.list([
        BasicEvent(
          id: 0,
          title: 'My Event',
          color: Colors.blue,
          start: LocalDate.today().at(LocalTime(13, 0, 0)),
          end: LocalDate.today().at(LocalTime(15, 0, 0)),
        ),
      ]),
      initialTimeRange: InitialTimeRange.range(
        startTime: LocalTime(8, 0, 0),
        endTime: LocalTime(20, 0, 0),
      ),
      initialDate: LocalDate.today(),
      visibleRange: VisibleRange.days(3),
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
        height: MediaQuery.of(context).size.height,
        child: Timetable<BasicEvent>(
          theme: TimetableThemeData(
              hourTextStyle: TextStyle(color: Colors.blue),
              dividerColor: secondary),
          controller: _controller,
          onEventBackgroundTap: (start, isAllDay) {},
          eventBuilder: (event) {
            return BasicEventWidget(
              event,
              onTap: () => _showSnackBar('Part-day event $event tapped'),
            );
          },
          allDayEventBuilder: (context, event, info) => BasicAllDayEventWidget(
            event,
            info: info,
            onTap: () => _showSnackBar('All-day event $event tapped'),
          ),
        ));
  }

  void _showSnackBar(String content) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(content),
    ));
  }
}
