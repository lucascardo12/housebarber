import 'package:housebarber/model/user.dart';
import 'package:mongo_dart/mongo_dart.dart';

class BancoMg {
  Db bk;
  openDB() async {
    await bk.open();
  }

  closeDB() async {
    await bk.close();
  }

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
}
