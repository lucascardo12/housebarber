import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/login-controller.dart';
import 'package:housebarber/pages/login/register-new-user-page.dart';
import 'package:housebarber/pages/login/sub-login-page.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LoginPage extends GetView {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        LiquidSwipe(
          pages: [
            SubLoginPage(),
            CadastroPage(),
          ],
          waveType: WaveType.liquidReveal,
          ignoreUserGestureWhileAnimating: true,
        ),
      ]),
    );
  }
}
