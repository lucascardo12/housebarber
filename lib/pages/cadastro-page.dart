import 'dart:math';

import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/user.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                              labelText: "Cadastro:",
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
            )));
  }
}
