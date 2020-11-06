import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryLight,
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 1.35,
                decoration: new BoxDecoration(
                    color: secondary,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'House Barber Shop',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ],
                )),
            ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          color: primaryLight,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: secondary,
                          onPressed: () {},
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Sigup',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
