import 'package:flutter/cupertino.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class CustomWidgets {
  static Widget widgetsHome(String indexMenu) {
    var nada = Container();
    return nada;
  }

  static String moneyFormat(double amount) {
    return FlutterMoneyFormatter(
        amount: amount,
        settings: MoneyFormatterSettings(
          symbol: 'R\$',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2,
        )).output.symbolOnLeft;
  }
}
