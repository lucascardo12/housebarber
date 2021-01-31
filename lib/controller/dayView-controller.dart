import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';

List<Agendamento> getDataSource2() {
  return listAgenda;
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
