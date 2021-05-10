import 'package:get/get.dart';

import 'package:housebarber/services/global.dart';

class HomeController extends GetxController {
  final MongoDB db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  var pag = 0.obs;
}
