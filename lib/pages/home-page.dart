import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/pages/addEvento-page.dart';
import 'package:housebarber/pages/dayView-page.dart';
import 'package:housebarber/pages/login-page.dart';
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

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime.now(): [
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            color: Colors.pink,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarouselSemanal, _calendarCarouselMensal;

  @override
  void initState() {
    _markedDateMap.add(
        new DateTime(2019, 2, 25),
        new Event(
          date: new DateTime(2019, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2019, 2, 10),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2019, 2, 11), [
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarouselSemanal = CalendarCarousel<Event>(
      locale: 'pt',
      onDayPressed: (DateTime date, List<Event> events) {
        print(_currentDate);
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        locale: Locale('pt', 'BR'),
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      headerText: 'Semanal',
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        locale: Locale('pt', 'BR'),
        color: Colors.white,
      ),
      todayTextStyle: TextStyle(
        locale: Locale('pt', 'BR'),
        color: secondary,
      ),
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      weekdayTextStyle: TextStyle(color: Colors.white),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: primary,
      todayBorderColor: secondary,
      selectedDayButtonColor: secondary,
      markedDateMoreShowTotal: true,
    );

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
            await bacon.getAgendamentos().then((value) {
              if (value != null) {
                listAgenda = value;
              }
            });
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
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: primaryLight,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: _calendarCarouselSemanal,
            ),
            eventosDoDia(dia: _currentDate)
          ],
        );
        break;
      default:
        return new Container(
          child: Center(child: Text('Em Construção')),
        );
    }
  }
}
