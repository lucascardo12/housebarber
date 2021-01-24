import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/pages/addEvento-page.dart';
import 'package:housebarber/pages/dayView-page.dart';
import 'package:housebarber/pages/login-page.dart';
import 'package:housebarber/pages/weekView-page.dart';
import 'package:intl/intl.dart' show DateFormat;

class HomePage extends StatefulWidget {
  HomePage(this.xi);
  int xi = 1;
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage())),
          ),
          title: new Text('Home'),
        ),
        floatingActionButton: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => dialogCriaeAlteraEvent(context: context),
          color: Colors.blue,
          iconSize: 38,
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          items: [
            TabItem(icon: Icons.home, title: 'Diario'),
            TabItem(icon: Icons.map, title: 'Semanal'),
            TabItem(icon: Icons.settings, title: 'Opções'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            setState(() {
              widget.xi = i + 1;
            });
          },
        ),
        backgroundColor: primaryLight,
        body: WillPopScope(
            onWillPop: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage())),
            child: SingleChildScrollView(child: body(i: widget.xi))));
  }

  Widget body({int i}) {
    switch (i) {
      case 1:
        return new DayView();
        break;
      case 2:
        return new WeekView();
        break;
      default:
        return new Container(
          child: Center(child: Text('Em Construção')),
        );
    }
  }
}
