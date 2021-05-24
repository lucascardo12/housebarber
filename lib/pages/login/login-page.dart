import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/login-controller.dart';
import 'package:housebarber/pages/login/register-new-user-page.dart';
import 'package:housebarber/pages/login/sub-login-page.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LoginPage extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  final pages = [
    SubLoginPage(),
    CadastroPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => LiquidSwipe(
          pages: pages,
          waveType: WaveType.liquidReveal,
          ignoreUserGestureWhileAnimating: true,
          positionSlideIcon: 0.9,
          slideIconWidget: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
