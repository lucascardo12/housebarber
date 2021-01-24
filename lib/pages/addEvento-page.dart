import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';

Future<void> dialogCriaeAlteraEvent(
    {BuildContext context, int horaIni = 0}) async {
  TextEditingController dateControler = TextEditingController();
  TextEditingController horaInicControler = TextEditingController();
  TextEditingController horaFimControler = TextEditingController();
  TextEditingController clienteControler = TextEditingController();
  TextEditingController servicoControler = TextEditingController();
  horaInicControler.text = horaIni.toString().padLeft(2, '0') + ':00';
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 400),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0)),
            color: primaryLight,
            child: Container(
                decoration: BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Theme(
                    data: new ThemeData(
                      indicatorColor: Colors.white,
                      cursorColor: Colors.white,
                      primaryColor: Colors.white,
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(40),
                      children: [
                        Center(
                            child: Text(
                          'Cadastro de Agendamento',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: clienteControler,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: secondary,
                              ),
                              labelText: "Cliente:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: servicoControler,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.miscellaneous_services,
                                color: secondary,
                              ),
                              labelText: "Serviço:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        new TextField(
                          readOnly: true,
                          onTap: () {
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
                              if (selectedDate != null) {
                                dateControler.text =
                                    Customfunctions.stringData(selectedDate);
                              }
                            });
                          },
                          controller: dateControler,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Data:',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: secondary,
                            ),
                          ),
                        ),
                        new TextField(
                          readOnly: true,
                          controller: horaInicControler,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Hora inicio:',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.lock_clock,
                              color: secondary,
                            ),
                          ),
                          onTap: () {
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child,
                                  );
                                }).then((selectedDate) {
                              if (selectedDate != null) {
                                horaInicControler.text =
                                    Customfunctions.stringHora(selectedDate);
                              }
                            });
                          },
                        ),
                        new TextField(
                            readOnly: true,
                            controller: horaFimControler,
                            textAlign: TextAlign.left,
                            onTap: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                        alwaysUse24HourFormat: true,
                                      ),
                                      child: child,
                                    );
                                  }).then((selectedDate) {
                                if (selectedDate != null) {
                                  horaFimControler.text =
                                      Customfunctions.stringHora(selectedDate);
                                }
                              });
                            },
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Hora Fim:',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.lock_clock,
                                color: secondary,
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
                          color: secondary,
                          onPressed: () {
                            Agendamento auxi = new Agendamento(
                                idUser: user.idUser,
                                idCliente: clienteControler.text,
                                dia: dateControler.text,
                                horaFim: horaFimControler.text,
                                horaInicio: horaInicControler.text,
                                servico: servicoControler.text);

                            bacon
                                .alteraAgendamento(agendamento: auxi)
                                .then((value) async {
                              if (value != null) {
                                await bacon
                                    .getAgendamentos()
                                    .then((value) => listAgenda = value);
                              }
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ))),
          ));
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
