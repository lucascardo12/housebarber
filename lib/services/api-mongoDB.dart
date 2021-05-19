import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';

class ApiMongoDB extends GetConnect {
  String login = 'AppsFoda';
  String senha = '';
  String loginDb = 'lucascardo12';
  String senhaDb = 'fuckyuo12';
  String hostDb = 'cluster0.p6s2p.mongodb.net';
  String clusterDb = 'Cluster0';
  String formatDb = 'mongodb+srv';
  String host = '';

  Future<bool> insertUpdate({dynamic objeto, String tabela}) async {
    try {
      Map<String, String> headers = new Map<String, String>();
      headers['senhaDb'] = senhaDb;
      headers['clusterDb'] = clusterDb;
      headers['formatDb'] = formatDb;
      headers['hostDb'] = hostDb;
      headers['loginDb'] = loginDb;
      headers['tabela'] = tabela;
      headers['login'] = login;
      headers['senha'] = senha;

      Response result = await post(
        'http://$host/InsertUpdate',
        objeto.toJson(),
        headers: headers,
        contentType: "application/json",
      );

      return result.isOk;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleta({dynamic objeto, String tabela}) async {
    try {
      Map<String, String> headers = new Map<String, String>();
      headers['senhaDb'] = senhaDb;
      headers['clusterDb'] = clusterDb;
      headers['formatDb'] = formatDb;
      headers['hostDb'] = hostDb;
      headers['loginDb'] = loginDb;
      headers['selector'] = '{"_id": ${objeto.id}';
      headers['tabela'] = tabela;
      headers['login'] = login;
      headers['senha'] = senha;

      Response result = await delete(
        'http://$host/Delete',
        headers: headers,
        contentType: "application/json",
      );
      return result.isOk;
    } catch (e) {
      return false;
    }
  }

  Future<List<dynamic>> getData({dynamic selector, @required String tabela}) async {
    //{'_id': data.id} selector
    try {
      Map<String, String> headers = new Map<String, String>();
      headers['senhaDb'] = senhaDb;
      headers['clusterDb'] = clusterDb;
      headers['formatDb'] = formatDb;
      headers['hostDb'] = hostDb;
      headers['loginDb'] = loginDb;
      headers['selector'] = selector;
      headers['tabela'] = tabela;
      headers['login'] = login;
      headers['senha'] = senha;

      Response result = await get(
        'http://$host/GetData',
        headers: headers,
        contentType: "application/json",
      );
      return jsonDecode(result.bodyString)["data"];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
