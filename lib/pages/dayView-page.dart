import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/controller/dayView-controller.dart';
import 'package:housebarber/model/meetsData.dart';
import 'package:housebarber/pages/addEvento-page.dart';
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
        height: MediaQuery.of(context).size.height * 0.80,
        child: Scaffold(
            floatingActionButton: IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                await dialogCriaeAlteraEvent(context: context);
                setState(() {
                  print('test');
                });
              },
              color: Colors.blue,
              iconSize: 38,
            ),
            body: SfCalendar(
              dataSource: MeetingDataSource(getDataSource(tipo: 1)),
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
            )));
  }
}
