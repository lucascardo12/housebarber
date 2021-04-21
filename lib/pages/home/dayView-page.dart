import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DayView extends GetView {
  final gb = Get.find<Global>();
  // CalendarController _controller;
  // @override
  // void initState() {
  //   _controller = CalendarController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gb.primaryLight,
      height: Get.height * 0.90,
      child: Scaffold(
        floatingActionButton: Card(
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: gb.secondary,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                // await dialogCriaeAlteraEvent(
                //     context: context,
                //     horaIni: _controller.selectedDate != null ? _controller.selectedDate.hour : 0,
                //     dataMarcada: _controller.selectedDate);
                // setState(() {});
              },
              color: Colors.blue,
              iconSize: 38,
            )),
        body: SfCalendar(
          //controller: _controller,
          onTap: (calendarTapDetails) async {
            // if (calendarTapDetails.appointments != null) {
            //   await dialogCriaeAlteraEvent(
            //     context: context,
            //     evento: calendarTapDetails.appointments.first,
            //   ).then((value) => setState(() {}));
            // }
          },
          dataSource: AgendamentoDataSource(gb.listAgenda),
          showNavigationArrow: true,
          headerStyle: CalendarHeaderStyle(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: gb.primaryLight,
          timeSlotViewSettings: TimeSlotViewSettings(
            timeFormat: 'H',
            timeTextStyle: TextStyle(
              color: gb.secondary,
              fontSize: 14,
            ),
          ),
          view: CalendarView.day,
          cellBorderColor: gb.secondary,
          viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          appointmentBuilder: (
            BuildContext context,
            CalendarAppointmentDetails details,
          ) {
            final Agendamento agenda = details.appointments.first;
            return Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                color: gb.secondary,
              ),
              child: Center(
                child: Text(
                  "lucas" +
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
