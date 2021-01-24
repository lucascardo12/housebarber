import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class WeekView extends StatefulWidget {
  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        height: MediaQuery.of(context).size.height - 200,
        child: SfCalendar(
          timeSlotViewSettings: TimeSlotViewSettings(timeFormat: 'H'),
          view: CalendarView.week,
        ));
  }
}
