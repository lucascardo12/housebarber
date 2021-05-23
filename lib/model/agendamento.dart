import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agendamento {
  int id;
  String title;
  int idUser;
  int idCliente;
  int idServico;
  DateTime startTime;
  DateTime endTime;
  DateTime data;

  Agendamento({
    this.idUser,
    this.idCliente,
    this.idServico,
    this.id,
    this.endTime,
    this.startTime,
    this.data,
  });

  Agendamento.fromJson(Map<String, dynamic> xjson) {
    idUser = xjson['idUser'];
    idCliente = xjson['idCliente'];
    idServico = xjson['idServico'];
    id = xjson['_id'];
    endTime = DateTime.parse(xjson['endTime']);
    startTime = DateTime.parse(xjson['startTime']);
    data = xjson['data'];
  }

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'idCliente': idCliente,
        'idServico': idServico,
        '_id': id,
        'endTime': endTime.toString(),
        'startTime': startTime.toString(),
        'data': data,
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map['idUser'] = idUser;
    map['idCliente'] = idCliente;
    map['idServico'] = idServico;
    map['_id'] = id;
    map['endTime'] = endTime;
    map['startTime'] = startTime;
    map['data'] = data;
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

  int getdata(int index) {
    return appointments[index].data;
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
