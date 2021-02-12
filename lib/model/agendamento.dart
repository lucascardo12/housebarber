import 'package:housebarber/config/global.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agendamento {
  int id;
  String valor;
  String dia;
  String title;
  int idUser;
  String idCliente;
  DateTime startTime;
  DateTime endTime;
  String servico;

  Agendamento(
      {this.valor,
      this.dia,
      this.idUser,
      this.idCliente,
      this.id,
      this.endTime,
      this.startTime,
      this.servico});

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
    return appointments[index].idCliente;
  }
}
