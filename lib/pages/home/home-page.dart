import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/home-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/pages/home/dayView-page.dart';
import 'package:housebarber/pages/home/settings-page.dart';
import 'package:housebarber/pages/home/monthView-page.dart';
import 'package:housebarber/pages/home/new-registers-page.dart';
import 'package:housebarber/widgets/mensagem-confirmar.dart';

class HomePage extends GetView {
  final HomeController controller = Get.put(HomeController());
  final gb = Get.find<Global>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          items: [
            TabItem(icon: Icons.home, title: 'Diario'),
            TabItem(icon: Icons.calendar_today, title: 'Mensal'),
            TabItem(icon: Icons.fiber_new, title: 'Cadastros'),
            TabItem(icon: Icons.settings, title: 'Opções'),
          ],
          initialActiveIndex: controller.pag.value,
          onTap: (int i) => controller.pag.value = i,
        ),
        backgroundColor: gb.primaryLight,
        body: Obx(
          () => SafeArea(
            child: WillPopScope(
                onWillPop: () => showConfirme(
                    context: context,
                    label: "Tem certeza que quer sair vagabundo",
                    confirme: () => SystemNavigator.pop(),
                    cancel: () => Get.back()),
                child: [
                  DayView(),
                  MonthViewPage(),
                  NewRegistersPage(),
                  SettingsPage(),
                ].elementAt(controller.pag.value)),
          ),
        ));
  }
}
