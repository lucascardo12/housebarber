import 'package:flutter/material.dart';

class CampoPadrao extends StatelessWidget {
  final TextEditingController controler;
  final IconData icone;
  final String label;
  final Color cor;

  const CampoPadrao({Key key, this.controler, this.icone, this.label, this.cor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
