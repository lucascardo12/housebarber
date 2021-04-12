import 'package:mongo_dart/mongo_dart.dart';

class BancoMg {
  Db bk;

  Future<dynamic> insertUpdate({dynamic objeto, String tabela}) async {
    try {
      var collection = bk.collection(tabela);
      var auxi = await collection.count();
      if (objeto.id == null) {
        if (auxi == 0) {
          objeto.id = 1;
        } else {
          var i = await collection.find(where.sortBy('_id', descending: true)).first;
          objeto.id = i['_id'] + 1;
        }
        await collection.insert(objeto.toJson());
      } else {
        await collection.save(objeto.toJson());
      }
      return objeto;
    } catch (e) {
      return null;
    }
  }

  Future<bool> delete({dynamic objeto, String tabela}) async {
    try {
      var collection = bk.collection(tabela);
      await collection.remove({'_id': objeto.id});
      return true;
    } catch (e) {
      return false;
    }
  }
}
