import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';

class SubLoginPage extends StatefulWidget {
  @override
  _SubLoginPageState createState() => _SubLoginPageState();
}

class _SubLoginPageState extends State<SubLoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        child: Theme(
            data: new ThemeData(
              cursorColor: Colors.white,
              primaryColor: Colors.white,
            ),
            child: ListView(
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
                            controller: loginController,
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
                          obscureText: !_showPassword,
                          controller: senhaController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Senha:',
                            prefixIcon: const Icon(
                              Icons.security,
                              color: Colors.white,
                              size: 28,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color:
                                    _showPassword ? Colors.white : Colors.white,
                              ),
                              onPressed: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
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
                          onPressed: () {
                            Map<String, String> infoArray = {
                              'login': loginController.text,
                              'senha': senhaController.text
                            };
                            Customfunctions.validaLogin(
                                infoArray: infoArray, context: context);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ],
            )));
  }
}
