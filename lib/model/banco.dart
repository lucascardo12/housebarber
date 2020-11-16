import 'package:housebarber/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'empresa.dart';

class BancoMg {
  Db bk;
  openDB() async {
    await bk.open();
  }

  closeDB() async {
    await bk.close();
  }

//FUNÇÕES DE BANCO DA CLASSE USER
  getUser({String senha, String login}) async {
    try {
      if (senha != null && login != null) {
        var ret;
        await openDB();
        var collection = bk.collection('user');
        ret = await collection.findOne({"senha": senha, 'login': login});
        User user = User.fromJson(ret);
        await closeDB();
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
        if (user.id == null) {
          user.id = await collection.count() + 1;
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
        await collection.remove(where.eq('_id', user.id));
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
          empresa.idEmpresa = await collection.count() + 1;
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
}
