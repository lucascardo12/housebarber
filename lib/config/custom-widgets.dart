import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class CustomWidgets {
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
}
