import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';

class SubLoginPage extends StatefulWidget {
  @override
  _SubLoginPageState createState() => _SubLoginPageState();
}

class _SubLoginPageState extends State<SubLoginPage> {
  TextEditingController loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
            )));
  }
}
