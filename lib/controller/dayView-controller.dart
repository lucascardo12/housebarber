import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DayViewController extends GetxController {
  CalendarController controller;
  @override
  void onInit() {
    controller = CalendarController();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
