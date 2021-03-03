import 'package:flutter/material.dart';
import 'package:housebarber/pages/login/register-new-user-page.dart';
import 'package:housebarber/pages/login/sub-login-page.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int page = 0;
  LiquidController liquidController;

  var screenWidgt;
  UpdateType updateType;
  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        LiquidSwipe(
          pages: [new SubLoginPage(), new CadastroPage()],
          onPageChangeCallback: pageChangeCallback,
          waveType: WaveType.liquidReveal,
          liquidController: liquidController,
          ignoreUserGestureWhileAnimating: true,
        ),
        // Padding(
        //   padding: EdgeInsets.all(20),
        //   child: Column(
        //     children: <Widget>[
        //       Expanded(child: SizedBox()),
        //       Align(
        //         child: Image.asset(
        //           "assets/arraste_lados.gif",
        //           color: Colors.white,
        //           height: 80.0,
        //           width: 80.0,
        //         ),
        //         alignment: Alignment.centerRight,
        //       )
        //     ],
        //   ),
        // ),
      ]),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}