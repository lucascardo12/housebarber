import 'package:housebarber/config/global.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agendamento {
  int id;
  String dia;
  String title;
  int idUser;
  int idCliente;
  int idServico;
  DateTime startTime;
  DateTime endTime;

  Agendamento({
    this.dia,
    this.idUser,
    this.idCliente,
    this.idServico,
    this.id,
    this.endTime,
    this.startTime,
  });

  Agendamento.fromJson(Map<String, dynamic> xjson) {
    dia = xjson['dia'];
    idUser = xjson['idUser'];
    idCliente = xjson['idCliente'];
    idServico = xjson['idServico'];
    id = xjson['_id'];
    endTime = xjson['endTime'];
    startTime = xjson['startTime'];
  }

  Map<String, dynamic> toJson() => {
        'dia': dia,
        'idUser': idUser,
        'idCliente': idCliente,
        'idServico': idServico,
        '_id': id,
        'endTime': endTime,
        'startTime': startTime,
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map['dia'] = dia;
    map['idUser'] = idUser;
    map['idCliente'] = idCliente;
    map['idServico'] = idServico;
    map['_id'] = id;
    map['endTime'] = endTime;
    map['startTime'] = startTime;
  }

  static Future<List<Agendamento>> getData({dynamic selector}) async {
    //{'_id': data.id} selector
    try {
      List<Agendamento> data = <Agendamento>[];
      var collection = bacon.bk.collection('Agendamento');
      await collection.find(selector).forEach((element) {
        data.add(Agendamento.fromJson(element));
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
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
    return appointments[index].idCliente.toString();
  }
}
