import 'package:flutter/material.dart';
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

  static Widget loading() {
    return Container(
      color: Color.fromRGBO(252, 252, 255, 1),
      child: Center(
          child: Container(
              child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
            Image.asset(
              'assets/barber-shop.gif',
              height: 100,
              width: 100,
            ),
            Text('Carregando...')
          ]))),
    );
  }

  static Widget campoPadrao(
      {String label,
      IconData icone,
      TextEditingController controler,
      Color cor}) {
    return TextField(
      controller: controler,
      style: TextStyle(color: cor),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icone,
          color: cor,
          size: 28,
        ),
        labelStyle: TextStyle(
          color: cor,
          fontSize: 16,
        ),
      ),
    );
  }
}
