import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/funcionario.dart';

class Agendamento {
  int id;
  String valor;
  String dia;
  String title;
  String idUser;
  String idCliente;
  String horaInicio;
  String horaFim;
  String servico;

  Agendamento({
    String valor,
    String dia,
    String idUser,
    String idCliente,
    int id,
    String horaInicio,
    String servico,
    String horaFim,
  }) {
    this.valor = valor;
    this.dia = dia;
    this.idUser = idUser;
    this.idCliente = idCliente;
    this.id = id;
    this.horaFim = horaFim;
    this.horaInicio = horaInicio;
    this.servico = servico;
  }
  Agendamento.fromJson(Map<String, dynamic> xjson) {
    valor = xjson['valor'];
    dia = xjson['dia'];
    idUser = xjson['idUser'];
    idCliente = xjson['idCliente'];
    id = xjson['_id'];
    horaFim = xjson['horaFim'];
    horaInicio = xjson['horaInicio'];
    servico = xjson['servico'];
  }

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'dia': dia,
        'idUser': idUser,
        'idCliente': idCliente,
        '_id': id,
        'horaFim': horaFim,
        'horaInicio': horaInicio,
        'servico': servico
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map['valor'] = valor;
    map['dia'] = dia;
    map['idUser'] = idUser;
    map['idCliente'] = idCliente;
    map['_id'] = id;
    map['horaFim'] = horaFim;
    map['horaInicio'] = horaInicio;
    map['servico'] = servico;
  }
}
