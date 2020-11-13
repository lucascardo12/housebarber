import 'dart:math';

import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/user.dart';
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
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );
  UpdateType updateType;
  test() async {
    User user =
        new User(login: 'lucascardo12', senha: 'fuckyuo12', tipoUser: '2');
    //bacon.alteraUser(user: user);
    var ret = await bacon.getUser(login: 'lucascardo12', senha: 'fuckyuo12');
    if (ret.toString() != "Instance of 'Future<dynamic>'") {
      if (ret != null) {
        ret.tipoUser = '1';
        //await bacon.alteraUser(user: ret);
      }
    }
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  List<Container> pages = [
    Container(
        color: primaryLight,
        child: Theme(
            data: new ThemeData(
              cursorColor: Colors.white,
              primaryColor: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Center(
                    child: Text(
                  'House Barber Shop',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            //controller: loginController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Login:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Senha:",
                              hintStyle: TextStyle(color: Colors.white),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 100, right: 100),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: secondary,
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ],
            ))),
    Container(
        color: secondary,
        child: Theme(
            data: new ThemeData(
              cursorColor: Colors.white,
              primaryColor: Colors.white,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                  'House Barber Shop',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Cadastro',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            //controller: loginController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Nome:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            //controller: loginController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Login:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            //controller: loginController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Numero:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            //controller: loginController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "CPF/CNPJ:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "E-mail:",
                              hintStyle: TextStyle(color: Colors.white),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Tipo de usario:",
                              hintStyle: TextStyle(color: Colors.white),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 100, right: 100),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: primary,
                          onPressed: () {},
                          child: Text(
                            'Registrar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ],
            ))),
  ];

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
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FlatButton.icon(
              label: Text(
                page == 0 ? "Cadastro" : "Login",
                style:
                    TextStyle(color: page == 0 ? Colors.white : Colors.white),
              ),
              onPressed: () {
                liquidController.jumpToPage(page: page + 1);
              },
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: page == 0 ? Colors.white : Colors.white,
              ),
              color: Colors.transparent,
            ),
          ),
        )
      ]),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
