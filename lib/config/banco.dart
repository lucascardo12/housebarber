import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/funcionario.dart';
import 'package:housebarber/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../model/empresa.dart';

class BancoMg {
  Db bk;
  openDB() async {
    await bk.open();
  }

  closeDB() async {
    await bk.close();
  }

//FUNÇÕES DE BANCO DA CLASSE USER
  getUser({String senha, String login, String tipoUser}) async {
    User user = new User();
    try {
      if (senha != null && login != null) {
        var ret;
        await openDB();
        var collection = bk.collection('user');
        ret = await collection.findOne({"senha": senha, 'login': login});
        user = User.fromJson(ret);
        await closeDB();
        return user;
      } else {
        return user;
      }
    } catch (e) {
      print(e);
    }
  }

  alteraUser({User user}) async {
    try {
      if (user != null) {
        var ret;
        await openDB();
        var collection = bk.collection('user');
        if (user.idUser == null) {
          var i = await collection.count() + 1;
          user.idUser = i.toString();
          await collection.insert(user.toJson());
        } else {
          await collection.save(user.toJson());
        }
        await closeDB();
        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  removeUser({User user}) async {
    try {
      if (user != null) {
        var ret;
        await openDB();
        var collection = bk.collection('user');
        await collection.remove(where.eq('_id', user.idUser));
        await closeDB();
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
        await openDB();
        var collection = bk.collection('empresa');
        ret = await collection.findOne({"_id": idEmpresa});
        Empresa empresa = Empresa.fromJson(ret);
        await closeDB();
        return empresa;
      }
    } catch (e) {
      print(e);
    }
  }

  alteraEmpresa({Empresa empresa}) async {
    try {
      if (empresa != null) {
        var ret;
        await openDB();
        var collection = bk.collection('empresa');
        if (empresa.idEmpresa == null) {
          var i = await collection.count() + 1;
          empresa.idEmpresa = i.toString();
          await collection.insert(empresa.toJson());
        } else {
          await collection.save(empresa.toJson());
        }
        await closeDB();
        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  removeEmpresa({Empresa empresa}) async {
    try {
      if (empresa != null) {
        var ret;
        await openDB();
        var collection = bk.collection('empresa');
        await collection.remove(where.eq('_id', empresa.idEmpresa));
        await closeDB();
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
        await openDB();
        var collection = bk.collection('funcionario');
        ret = await collection.findOne({"_id": idFuncionario});
        Funcionario funcionario = Funcionario.fromJson(ret);
        await closeDB();
        return funcionario;
      }
    } catch (e) {
      print(e);
    }
  }

  alteraFuncionario({Funcionario funcionario}) async {
    try {
      if (funcionario != null) {
        var ret;
        await openDB();
        var collection = bk.collection('funcionario');
        if (funcionario.idFuncionario == null) {
          funcionario.idFuncionario = await collection.count() + 1;
          await collection.insert(funcionario.toJson());
        } else {
          await collection.save(funcionario.toJson());
        }
        await closeDB();
        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  removeFuncionario({Funcionario funcionario}) async {
    try {
      if (funcionario != null) {
        var ret;
        await openDB();
        var collection = bk.collection('funcionario');
        await collection.remove(where.eq('_id', funcionario.idFuncionario));
        await closeDB();
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
        await openDB();
        var collection = bk.collection('cliente');
        ret = await collection.findOne({"_id": idCliente});
        Cliente cliente = Cliente.fromJson(ret);
        await closeDB();
        return cliente;
      }
    } catch (e) {
      print(e);
    }
  }

  alteraCliente({Cliente cliente}) async {
    try {
      if (cliente != null) {
        var ret;
        await openDB();
        var collection = bk.collection('cliente');
        if (cliente.idCliente == null) {
          cliente.idCliente = await collection.count() + 1;
          await collection.insert(cliente.toJson());
        } else {
          await collection.save(cliente.toJson());
        }
        await closeDB();
        return ret;
      }
    } catch (e) {
      print(e);
    }
  }

  removeCliente({Cliente cliente}) async {
    try {
      if (cliente != null) {
        var ret;
        await openDB();
        var collection = bk.collection('cliente');
        await collection.remove(where.eq('_id', cliente.idCliente));
        await closeDB();
        return ret;
      }
    } catch (e) {
      print(e);
    }
  }
}
