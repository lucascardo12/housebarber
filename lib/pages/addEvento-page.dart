import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';

class AddEventoPage extends StatefulWidget {
  @override
  _AddEventoPageState createState() => _AddEventoPageState();
}

class _AddEventoPageState extends State<AddEventoPage> {
  TextEditingController loginController =
      TextEditingController(text: 'hugo.alves');

  TextEditingController dateControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agendamento'),
          actions: [],
        ),
        body: Container(
            color: primaryLight,
            child: Theme(
                data: new ThemeData(
                  indicatorColor: Colors.white,
                  cursorColor: Colors.white,
                  primaryColor: Colors.white,
                ),
                child: ListView(
                  padding: EdgeInsets.all(40),
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                        child: Text(
                      'Cadastro de Agendamento',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    new TextField(
                      readOnly: true,
                      controller: dateControler,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Data:',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            color: secondary,
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 5),
                              lastDate: DateTime(DateTime.now().year + 5),
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.fallback(),
                                  child: child,
                                );
                              },
                            ).then((selectedDate) {
                              setState(() {
                                if (selectedDate != null) {
                                  // dateControler.text =
                                  //     FunctionsP.stringData(
                                  //         selectedDate);
                                  // venc = selectedDate;
                                }
                              });
                            });
                          },
                        ),
                      ),
                    ),
                    new TextField(
                        readOnly: true,
                        controller: dateControler,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Hora inicio:',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.lock_clock,
                                  color: secondary,
                                ),
                                onPressed: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: true),
                                          child: child,
                                        );
                                      }).then((selectedDate) {
                                    setState(() {
                                      if (selectedDate != null) {
                                        // dateControler.text =
                                        //     FunctionsP.stringData(
                                        //         selectedDate);
                                        // venc = selectedDate;
                                      }
                                    });
                                  });
                                }))),
                    new TextField(
                        readOnly: true,
                        controller: dateControler,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            hintText: 'Hora Fim:',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.lock_clock,
                                  color: secondary,
                                ),
                                onPressed: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: true),
                                          child: child,
                                        );
                                      }).then((selectedDate) {
                                    setState(() {
                                      if (selectedDate != null) {
                                        // dateControler.text =
                                        //     FunctionsP.stringData(
                                        //         selectedDate);
                                        // venc = selectedDate;
                                      }
                                    });
                                  });
                                }))),
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
                        'Salvar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ))));
  }
}
