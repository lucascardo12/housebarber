import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/pages/home-page.dart';
import 'package:housebarber/pages/new-registers-page.dart';
import 'package:housebarber/pages/register-new-client-page.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:housebarber/config/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    prefs = await SharedPreferences.getInstance();
    bacon.bk = await Db.create(
        "mongodb+srv://lucascardo12:fuckyuo12@cluster0.p6s2p.mongodb.net/Cluster0?retryWrites=true&w=majority");
    await bacon.bk.open();
  } catch (e) {}
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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('pt', 'BR')
        ],
        routes: {
          // MAIN /
          //'/': (context) => LoginPage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/newRegisters': (context) => NewRegisters(),
          '/newClient': (context) => RegisterNewClient(),
        });
  }
}
