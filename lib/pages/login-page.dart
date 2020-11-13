import 'dart:math';

import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/pages/cadastro-page.dart';
import 'package:housebarber/pages/sub-login-page.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  int page = 0;
  LiquidController liquidController;
  var screenWidgt;
  UpdateType updateType;
  // test() async {
  //   User user =
  //       new User(login: 'lucascardo12', senha: 'fuckyuo12', tipoUser: '2');
  //   //bacon.alteraUser(user: user);
  //   var ret = await bacon.getUser(login: 'lucascardo12', senha: 'fuckyuo12');
  //   if (ret.toString() != "Instance of 'Future<dynamic>'") {
  //     if (ret != null) {
  //       ret.tipoUser = '1';
  //       //await bacon.alteraUser(user: ret);
  //     }
  //   }
  // }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  List<dynamic> pages = [CadastroPage(), SubLoginPage()];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var page = 0;
    if (liquidController.provider != null) {
      page = liquidController.currentPage;
    }
    return Scaffold(
      body: Stack(children: [
        LiquidSwipe(
          pages: pages,
          onPageChangeCallback: pageChangeCallback,
          waveType: WaveType.liquidReveal,
          liquidController: liquidController,
          ignoreUserGestureWhileAnimating: true,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, _buildDot),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
