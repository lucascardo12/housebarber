import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
    ));
  }
}
