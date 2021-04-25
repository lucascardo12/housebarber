import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agendamento {
  int id;
  String title;
  int idUser;
  int idCliente;
  int idServico;
  DateTime startTime;
  DateTime endTime;

  Agendamento({
    this.idUser,
    this.idCliente,
    this.idServico,
    this.id,
    this.endTime,
    this.startTime,
  });

  Agendamento.fromJson(Map<String, dynamic> xjson) {
    idUser = xjson['idUser'];
    idCliente = xjson['idCliente'];
    idServico = xjson['idServico'];
    id = xjson['_id'];
    endTime = xjson['endTime'];
    startTime = xjson['startTime'];
  }

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'idCliente': idCliente,
        'idServico': idServico,
        '_id': id,
        'endTime': endTime,
        'startTime': startTime,
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map['idUser'] = idUser;
    map['idCliente'] = idCliente;
    map['idServico'] = idServico;
    map['_id'] = id;
    map['endTime'] = endTime;
    map['startTime'] = startTime;
  }
}

class AgendamentoDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  AgendamentoDataSource(List<dynamic> source) {
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
    return appointments[index].idCliente.toString();
  }
}
