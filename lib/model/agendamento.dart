import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agendamento {
  int id;
  String valor;
  String dia;
  String title;
  String idUser;
  String idCliente;
  DateTime startTime;
  DateTime endTime;
  String servico;

  Agendamento({
    String valor,
    String dia,
    String idUser,
    String idCliente,
    int id,
    DateTime startTime,
    String servico,
    DateTime endTime,
  }) {
    this.valor = valor;
    this.dia = dia;
    this.idUser = idUser;
    this.idCliente = idCliente;
    this.id = id;
    this.endTime = endTime;
    this.startTime = startTime;
    this.servico = servico;
  }
  Agendamento.fromJson(Map<String, dynamic> xjson) {
    valor = xjson['valor'];
    dia = xjson['dia'];
    idUser = xjson['idUser'];
    idCliente = xjson['idCliente'];
    id = xjson['_id'];
    endTime = xjson['endTime'];
    startTime = xjson['startTime'];
    servico = xjson['servico'];
  }

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'dia': dia,
        'idUser': idUser,
        'idCliente': idCliente,
        '_id': id,
        'endTime': endTime,
        'startTime': startTime,
        'servico': servico
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map['valor'] = valor;
    map['dia'] = dia;
    map['idUser'] = idUser;
    map['idCliente'] = idCliente;
    map['_id'] = id;
    map['endTime'] = endTime;
    map['startTime'] = startTime;
    map['servico'] = servico;
  }
}

class AgendamentoDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  AgendamentoDataSource(List<Agendamento> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].startTime;
  }

  int getIds(int index) {
    return appointments[index].id;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments[index].idCliente;
  }
}
