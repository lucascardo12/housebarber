import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_formatter/money_formatter.dart';

class Customfunctions {
  static String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }

  static String capitalize(String palavra) {
    var up = palavra.substring(0, 1).toUpperCase();
    return palavra.replaceFirst(palavra.substring(0, 1), up);
  }

  // ignore: missing_return
  static Future<bool> verificarConexao() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  //converte Data para String
  static String stringData(DateTime date) {
    if (date != null) {
      final f = new DateFormat('dd/MM/yyyy');
      return f.format(date);
    } else {
      return null;
    }
  }

  static String stringHora(TimeOfDay hora) {
    if (hora != null) {
      return hora.hour.toString().padLeft(2, '0') + ":" + hora.minute.toString().padLeft(2, '0');
    } else {
      return null;
    }
  }

  //converte String em data
  static DateTime dataString({@required String data}) {
    DateTime date;

    String datt = data.substring(6, 10) + '-' + data.substring(3, 5) + '-' + data.substring(0, 2);
    date = DateTime.parse(datt);

    return date;
  }

  static String moneyFormat(double amount) {
    return MoneyFormatter(
            amount: amount,
            settings: MoneyFormatterSettings(
                symbol: 'R\$',
                thousandSeparator: '.',
                decimalSeparator: ',',
                symbolAndNumberSeparator: ' ',
                fractionDigits: 2,
                compactFormatType: CompactFormatType.short))
        .output
        .symbolOnLeft;
  }

  String validaCampo(value, String label) {
    if (value.isEmpty) return "Campo $label não pode ser vazio";
    return null;
  }

  static DateTime dataStringHora(String horario) {
    return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
        int.tryParse(horario.substring(0, 2)), int.tryParse(horario.substring(3, 5)));
  }
}
