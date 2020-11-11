import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:housebarber/config/global.dart';
import 'pages/login-page.dart';

Future<void> main() async {
  bacon.bk = await Db.create(
      "mongodb+srv://lucascardo12:fuckyuo12@cluster0.p6s2p.mongodb.net/Cluster0?retryWrites=true&w=majority");

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
