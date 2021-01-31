import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/pages/dayView-page.dart';
import 'package:housebarber/pages/login-page.dart';
import 'package:housebarber/pages/monthView-page.dart';
import 'package:housebarber/pages/register-new-product-page.dart';
import 'package:housebarber/pages/weekView-page.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int xi;
  @override
  void initState() {
    xi = 1;
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
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          items: [
            TabItem(icon: Icons.home, title: 'Diario'),
            TabItem(icon: Icons.map, title: 'Semanal'),
            TabItem(icon: Icons.calendar_today, title: 'Mensal'),
            TabItem(icon: Icons.fiber_new, title: 'Cadastros'),
            TabItem(icon: Icons.settings, title: 'Opções'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            setState(() {
              xi = i + 1;
            });
          },
        ),
        backgroundColor: primaryLight,
        body: WillPopScope(
            onWillPop: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage())),
            child: SingleChildScrollView(child: body(i: xi))));
  }

  Widget body({int i}) {
    switch (i) {
      case 1:
        return new DayView();
        break;
      case 2:
        return new WeekView();
        break;
      case 3:
        return new MonthView();
        break;
      case 4:
        return new RegisterNewProduct();
        break;
      default:
        return new Container(
          child: Center(child: Text('Em Construção')),
        );
    }
  }
}
