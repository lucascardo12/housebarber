import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'pages/login-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Barber',
      theme: ThemeData(
        backgroundColor: primaryLight,
        brightness: Brightness.light,
        primaryColor: primary,
        primaryColorDark: primaryDark,
        primaryColorLight: primaryLight,
        accentColor: secondary,
      ),
      home: LoginPage(),
    );
  }
}
