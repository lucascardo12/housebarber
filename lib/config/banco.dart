import 'package:mongo_dart/mongo_dart.dart';

class BancoMg {
  Db bk;

  Future<dynamic> insertUpdate({dynamic objeto, String tabela}) async {
    try {
      var collection = bk.collection(tabela);
      if (objeto.id == null) {
        var i = await collection.find().last;
        objeto.id = i["_id"] + 1;
        await collection.insert(objeto.toJson());
      } else {
        await collection.save(objeto.toJson());
      }
      return objeto;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> delete({dynamic objeto, String tabela}) async {
    try {
      var collection = bk.collection(tabela);
      await collection.remove({'_id': objeto.id});
      return objeto;
    } catch (e) {
      return null;
    }
  }
}
