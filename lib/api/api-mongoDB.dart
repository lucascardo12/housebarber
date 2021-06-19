import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/senhas.dart';

class ApiMongoDB extends GetConnect {
  Future<bool> insertUpdate({
    dynamic objeto,
    String tabela,
  }) async {
    try {
      Map<String, String> headers = Map<String, String>();
      headers['senhaDb'] = senhaDb;
      headers['clusterDb'] = clusterDb;
      headers['formatDb'] = formatDb;
      headers['hostDb'] = hostDb;
      headers['loginDb'] = loginDb;
      headers['tabela'] = tabela;
      headers['login'] = loginApi;
      headers['senha'] = senhaApi;

      Response result = await post(
        'http://$hostApi/InsertUpdate',
        objeto.toJson(),
        headers: headers,
      );
      if (result.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleta({
    dynamic objeto,
    String tabela,
  }) async {
    try {
      Map<String, String> headers = Map<String, String>();
      headers['senhaDb'] = senhaDb;
      headers['clusterDb'] = clusterDb;
      headers['formatDb'] = formatDb;
      headers['hostDb'] = hostDb;
      headers['loginDb'] = loginDb;
      headers['selector'] = '{"_id": ${objeto.id}';
      headers['tabela'] = tabela;
      headers['login'] = loginApi;
      headers['senha'] = senhaApi;

      Response result = await delete(
        'http://$hostApi/teste',
        headers: headers,
      );
      if (result.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> getData({
    dynamic selector,
    @required String tabela,
  }) async {
    //{'_id': data.id} selector
    try {
      Map<String, String> headers = Map<String, String>();
      headers['senhaDb'] = senhaDb;
      headers['clusterDb'] = clusterDb;
      headers['formatDb'] = formatDb;
      headers['hostDb'] = hostDb;
      headers['loginDb'] = loginDb;
      headers['selector'] = json.encode(selector);
      headers['tabela'] = tabela;
      headers['login'] = loginApi;
      headers['senha'] = senhaApi;

      Response result = await get(
        'http://$hostApi/GetData',
        headers: headers,
      );
      return jsonDecode(result.bodyString)["data"];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
