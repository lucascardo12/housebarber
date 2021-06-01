import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/services/senhas.dart';
import 'package:housebarber/widgets/loading-widget.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Global extends GetxService {
  bool isLoading = false;
  User user;
  Box box;
  List<dynamic> listAgenda = [].obs;
  List<dynamic> listadeProdutoServico = [].obs;
  List<dynamic> listadeCliente = [].obs;
  Color primary = new Color(0xFF212121);
  Color primaryLight = new Color(0xFF484848);
  Color primaryDark = new Color(0xFF000000);
  Color secondary = new Color(0xFF2195f2);
  Color secondaryLight = new Color(0xFF6ec5ff);
  Color secondaryDark = new Color(0xFF0068bf);
  Color primaryText = new Color(0xFFffffff);
  Color secondaryText = new Color(0xFF000000);
  String version = "version: 1.0.1";

  Future<Global> inicia() async {
    await Hive.initFlutter();
    box = await Hive.openBox('global');
    return this;
  }

  void loadingPadrao() {
    Get.dialog(
      Loading(),
      transitionDuration: Duration.zero,
      barrierDismissible: false,
    );
  }
}

class MongoDB extends GetxService {
  Db db;

  Future<MongoDB> inicia() async {
    db = await Db.create("$formatDb://$loginDb:$senhaDb@$hostDb/$clusterDb?retryWrites=true&w=majority");
    await db.open();
    return this;
  }

  Future<void> verificaConexao() async {
    if (!db.isConnected) {
      await db.open();
    }
  }

  Future<dynamic> insertUpdate({dynamic objeto, String tabela}) async {
    try {
      await verificaConexao();
      var collection = db.collection(tabela);
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
      await verificaConexao();
      var collection = db.collection(tabela);
      await collection.remove({'_id': objeto.id});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> getData({dynamic selector, @required String tabela}) async {
    //{'_id': data.id} selector
    try {
      await verificaConexao();
      List<dynamic> data = [];
      var collection = db.collection(tabela);
      await collection.find(selector).forEach(
            (element) => data.add(element),
          );
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
