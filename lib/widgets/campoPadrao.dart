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
  final Color corIcon;
  final bool readOnly;
  final Function onTap;
  final int fontsizeLabel;
  final Color corLabel;

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
    this.corIcon,
    this.readOnly,
    this.onTap,
    this.fontsizeLabel,
    this.corLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
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
      onTap: onTap,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: icone != null
              ? Icon(
                  icone,
                  color: corIcon,
                  size: 28,
                )
              : null,
          prefixText: prefixText,
          labelStyle: TextStyle(
            color: corLabel ?? cor,
            fontSize: fontsizeLabel ?? 16,
          ),
          hintStyle: TextStyle(color: cor)),
    );
  }
}
