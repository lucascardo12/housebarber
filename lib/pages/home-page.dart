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
  HomePage();
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  int xi = 1;
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

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
          onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new AddEventoPage()))
              .then((value) async {
            setState(() {
              Customfunctions.atualizaListaDayView();
            });
          }),
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

  Widget eventosDoDia({DateTime dia}) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Card(
        color: primary,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cliente",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Hora Inicio",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Hora Fim",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Serviço",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Valor",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))),
      ),
    );
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
