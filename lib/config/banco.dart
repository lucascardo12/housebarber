import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/funcionario.dart';
import 'package:housebarber/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../model/empresa.dart';

class BancoMg {
  Db bk;
//FUNÇÕES DE BANCO DA CLASSE USER
  getUser({var infoArray}) async {
    User user = new User();
    try {
      if (infoArray['senha'] != null && infoArray['login'] != null) {
        var ret;

        var collection = bk.collection('user');
        ret = await collection.findOne({
          "senha": infoArray['senha'],
          "login": infoArray['login'].toLowerCase()
        });
        user = User.fromJson(ret);

        return user;
      } else {
        return user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<User> alteraUser({User user}) async {
    try {
      if (user != null) {
        var collection = bk.collection('user');
        if (user.idUser == null) {
          var i = await collection.count() + 1;
          //FAZER VALIDAÇÃO DE LOGIN EXISTENTE
          user.idUser = i.toString();
          await collection.insert(user.toJson());
        } else {
          await collection.save(user.toJson());
        }

        return user;
      } else {
        return user;
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  removeUser({User user}) async {
    try {
      if (user != null) {
        var ret;

        var collection = bk.collection('user');
        await collection.remove(where.eq('_id', user.idUser));

        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

//FUNÇÕES DE BANCO DA CLASSE EMPRESA
  getEmpresa({int idEmpresa}) async {
    try {
      if (idEmpresa != null) {
        var ret;

        var collection = bk.collection('empresa');
        ret = await collection.findOne({"_id": idEmpresa});
        Empresa empresa = Empresa.fromJson(ret);

        return empresa;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Empresa> alteraEmpresa({Empresa empresa}) async {
    Empresa ret = new Empresa();
    try {
      if (empresa != null) {
        var collection = bk.collection('empresa');
        if (empresa.idEmpresa == null) {
          var i = await collection.count() + 1;
          empresa.idEmpresa = i.toString();
          await collection.insert(empresa.toJson());
        } else {
          await collection.save(empresa.toJson());
        }

        return ret;
      } else {
        return ret;
      }
    } catch (e) {
      print(e);
    }
    return ret;
  }

  removeEmpresa({Empresa empresa}) async {
    try {
      if (empresa != null) {
        var ret;

        var collection = bk.collection('empresa');
        await collection.remove(where.eq('_id', empresa.idEmpresa));

        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  //FUNÇÕES DE BANCO DA CLASSE FUNCIONARIO
  getFuncionario({int idFuncionario}) async {
    try {
      if (idFuncionario != null) {
        var ret;

        var collection = bk.collection('funcionario');
        ret = await collection.findOne({"_id": idFuncionario});
        Funcionario funcionario = Funcionario.fromJson(ret);

        return funcionario;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Funcionario> alteraFuncionario({Funcionario funcionario}) async {
    Funcionario ret = new Funcionario();
    try {
      if (funcionario != null) {
        var collection = bk.collection('funcionario');
        if (funcionario.idFuncionario == null) {
          var i = await collection.count() + 1;
          funcionario.idFuncionario = i.toString();
          await collection.insert(funcionario.toJson());
        } else {
          await collection.save(funcionario.toJson());
        }

        return ret;
      } else {
        return ret;
      }
    } catch (e) {
      print(e);
    }
    return ret;
  }

  removeFuncionario({Funcionario funcionario}) async {
    try {
      if (funcionario != null) {
        var ret;

        var collection = bk.collection('funcionario');
        await collection.remove(where.eq('_id', funcionario.idFuncionario));

        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  //FUNÇÕES DE BANCO DA CLASSE CLIENTE
  getCliente({int idCliente}) async {
    try {
      if (idCliente != null) {
        var ret;

        var collection = bk.collection('cliente');
        ret = await collection.findOne({"_id": idCliente});
        Cliente cliente = Cliente.fromJson(ret);

        return cliente;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Cliente> alteraCliente({Cliente cliente}) async {
    Cliente ret = new Cliente();
    try {
      if (cliente != null) {
        var collection = bk.collection('cliente');
        if (cliente.idCliente == null) {
          var i = await collection.count() + 1;
          cliente.idCliente = i.toString();
          await collection.insert(cliente.toJson());
        } else {
          await collection.save(cliente.toJson());
        }

        return ret;
      } else {
        return ret;
      }
    } catch (e) {
      print(e);
    }
    return ret;
  }

  removeCliente({Cliente cliente}) async {
    try {
      if (cliente != null) {
        var ret;

        var collection = bk.collection('cliente');
        await collection.remove(where.eq('_id', cliente.idCliente));

        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  existeUser({String login}) async {
    bool exist = false;
    try {
      if (login != null) {
        var collection = bk.collection('user');
        await collection.findOne(where.eq('login', login)).then((value) {
          if (value != null) {
            exist = true;
            return exist;
          } else {
            return exist;
          }
        });

        return exist;
      }
    } catch (e) {
      print(e);
      return exist;
    }
  }

  // ignore: missing_return
  Future<List<Agendamento>> getAgendamentos() async {
    List<Agendamento> agendamento = <Agendamento>[];
    try {
      var collection = bk.collection('agendamento');
      await collection.find({'idUser': user.idUser}).forEach((element) {
        agendamento.add(Agendamento.fromJson(element));
      });

      return agendamento;
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<Agendamento> alteraAgendamento({Agendamento agendamento}) async {
    try {
      if (agendamento != null) {
        var collection = bk.collection('agendamento');
        if (agendamento.id == null) {
          var i = await collection.count() + 1;
          agendamento.id = i;
          await collection.insert(agendamento.toJson());
        } else {
          await collection.save(agendamento.toJson());
        }
        return agendamento;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Agendamento>> agendamentoExistente(
      Agendamento agendamento) async {
    List<Agendamento> agendamentoAuxi = <Agendamento>[];
    try {
      if (agendamento != null) {
        var collection = bk
            .collection('agendamento')
            .find({'idUser': agendamento.idUser, 'dia': agendamento.dia});
        await collection.forEach((element) {
          agendamentoAuxi.add(Agendamento.fromJson(element));
        });

        return agendamentoAuxi;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  removeAgendamento({Agendamento agendamento}) async {
    try {
      if (agendamento != null) {
        var ret;

        var collection = bk.collection('agendamento');
        await collection.remove(where.eq('_id', agendamento.id));

        return ret;
      }
    } catch (e) {
      print(e);
    }
  }
}
