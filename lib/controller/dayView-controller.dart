import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/meets.dart';

List<Meeting> getDataSource({int tipo}) {
  List<Meeting> meetings = <Meeting>[];
  if (tipo == 2) {
    listAgenda.forEach((element) {
      meetings.add(Meeting(element.idCliente, DateTime.parse(element.startTime),
          DateTime.parse(element.endTime), secondary, false));
    });
  }
  if (tipo == 1) {
    listAgenda.forEach((element) {
      var titulo = element.idCliente +
          '  das: ' +
          formataHora(
              hora: DateTime.parse(element.startTime).hour,
              minuto: DateTime.parse(element.startTime).minute) +
          '  as: ' +
          formataHora(
              hora: DateTime.parse(element.endTime).hour,
              minuto: DateTime.parse(element.endTime).minute);

      meetings.add(Meeting(titulo, DateTime.parse(element.startTime),
          DateTime.parse(element.endTime), secondary, false));
    });
  }

  return meetings;
}

String formataHora({int hora, int minuto}) {
  String string = "";
  if (hora.toString().length < 2) {
    string += "0" + hora.toString() + '-';
  } else {
    string += hora.toString() + '-';
  }
  if (minuto.toString().length < 2) {
    string += "0" + minuto.toString();
  } else {
    string += minuto.toString();
  }
  return string;
}
