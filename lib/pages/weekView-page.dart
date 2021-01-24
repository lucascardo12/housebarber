import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/controller/dayView-controller.dart';
import 'package:housebarber/model/meets.dart';
import 'package:housebarber/model/meetsData.dart';
import 'package:housebarber/pages/addEvento-page.dart';
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
              dataSource: MeetingDataSource(getDataSource(tipo: 2)),
              headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(color: Colors.white, fontSize: 20)),
              backgroundColor: primaryLight,
              timeSlotViewSettings: TimeSlotViewSettings(
                  timeFormat: 'H',
                  timeTextStyle: TextStyle(color: secondary, fontSize: 14)),
              view: CalendarView.week,
              cellBorderColor: secondary,
              viewHeaderStyle: ViewHeaderStyle(
                  dayTextStyle: TextStyle(color: Colors.white, fontSize: 12)),
            )));
  }
}
