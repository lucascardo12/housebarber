import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';

class RegisterNewProduct extends StatefulWidget {
  @override
  _RegisterNewProductPageState createState() => _RegisterNewProductPageState();
}

class _RegisterNewProductPageState extends State<RegisterNewProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        height: MediaQuery.of(context).size.height - 200,
        child: ListView(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          children: [
            FlatButton.icon(
              icon: Icon(Icons.person_add),
              color: secondaryLight,
              onPressed: () => null,
              label: Text('Clientes'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.ac_unit),
              color: secondaryLight,
              onPressed: () => null,
              label: Text('Produto/Serviço'),
            )
          ],
        ));
  }
}
