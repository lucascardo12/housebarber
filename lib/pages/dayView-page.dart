import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        height: MediaQuery.of(context).size.height - 200,
        child: SfCalendar(
          timeSlotViewSettings: TimeSlotViewSettings(timeFormat: 'H'),
          view: CalendarView.day,
        ));
  }
}
