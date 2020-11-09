import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/funcionario.dart';

class Agendamento {
  String valor;
  String diaHora;
  Empresa empresa;
  Cliente cliente;
  Funcionario funcionario;

  Agendamento(
      {String valor,
      String diaHora,
      Empresa empresa,
      Cliente cliente,
      Funcionario funcionario}) {
    this.valor = valor;
    this.diaHora = diaHora;
    this.empresa = empresa;
    this.cliente = cliente;
    this.funcionario = funcionario;
  }
  Agendamento.fromJson(Map<String, dynamic> xjson) {
    valor = xjson['valor'];
    diaHora = xjson['diaHora'];
    empresa = Empresa.fromJson(xjson['empresa']);
    cliente = Cliente.fromJson(xjson['cliente']);
    funcionario = Funcionario.fromJson(xjson['funcionario']);
  }

  Map<String, dynamic> toJson() => {
        'valor': valor,
        'diaHora': diaHora,
        'empresa': empresa,
        'cliente': cliente,
        'funcionario': funcionario
      };
  Agendamento.toMap(Map<String, dynamic> map) {
    map["valor"] = valor;
    map["diaHora"] = diaHora;
    map["empresa"] = empresa;
    map['cliente'] = cliente;
    map['funcionario'] = funcionario;
  }
}
