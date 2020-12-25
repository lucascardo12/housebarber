import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/funcionario.dart';

class Agendamento {
  int id;
  String valor;
  String dia;
  String title;
  String idBarbeiro;
  String idCliente;
  String horaInicio;
  String horaFim;
  String servico;

  Agendamento({
    String valor,
    String dia,
    String idBarbeiro,
    String idCliente,
    int id,
    String horaInicio,
    String servico,
    String horaFim,
  }) {
    this.valor = valor;
    this.dia = dia;
    this.idBarbeiro = idBarbeiro;
    this.idCliente = idCliente;
    this.id = id;
    this.horaFim = horaFim;
    this.horaInicio = horaInicio;
    this.servico = servico;
  }
  Agendamento.fromJson(Map<String, dynamic> xjson) {
    valor = xjson['valor'];
    dia = xjson['dia'];
    idBarbeiro = xjson['idBarbeiro'];
    idCliente = xjson['idCliente'];
    id = xjson['id'];
    horaFim = xjson['horaFim'];
    horaInicio = xjson['horaInicio'];
    servico = xjson['servico'];
  }

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'dia': dia,
        'idBarbeiro': idBarbeiro,
        'idCliente': idCliente,
        'id': id,
        'horaFim': horaFim,
        'horaInicio': horaInicio,
        'servico': servico
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map['valor'] = valor;
    map['dia'] = dia;
    map['idBarbeiro'] = idBarbeiro;
    map['idCliente'] = idCliente;
    map['id'] = id;
    map['horaFim'] = horaFim;
    map['horaInicio'] = horaInicio;
    map['servico'] = servico;
  }
}
