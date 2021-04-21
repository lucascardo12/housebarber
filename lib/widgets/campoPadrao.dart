import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoPadrao extends StatelessWidget {
  final TextEditingController controler;
  final IconData icone;
  final String label;
  final Color cor;
  final Function onChanged;
  final String initValue;
  final List<TextInputFormatter> maskPadrao;
  final Function validator;
  final String prefixText;
  final TextInputType keyboardType;
  CampoPadrao({
    Key key,
    this.controler,
    this.icone,
    this.label,
    this.cor,
    this.onChanged,
    this.initValue,
    this.maskPadrao,
    this.validator,
    this.prefixText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      initialValue: initValue,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (value.isEmpty) return 'Campo $label não pode ser vazio!';
            return null;
          },
      style: TextStyle(color: cor),
      inputFormatters: maskPadrao,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icone != null
            ? Icon(
                icone,
                color: cor,
                size: 28,
              )
            : null,
        prefixText: prefixText,
        labelStyle: TextStyle(
          color: cor,
          fontSize: 16,
        ),
      ),
    );
  }
}
