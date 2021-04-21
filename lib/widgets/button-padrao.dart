import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';

class ButtonPadrao extends GetView {
  final gb = Get.find<Global>();
  final String label;
  final Function onPressed;
  final Color backgroundColor;

  ButtonPadrao({
    this.label,
    this.onPressed,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 100, right: 100),
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: backgroundColor ?? gb.primary,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
