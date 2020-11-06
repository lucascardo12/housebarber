import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class CustomWidgets {
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
