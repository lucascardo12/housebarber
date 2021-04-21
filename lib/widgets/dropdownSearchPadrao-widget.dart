import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';

// ignore: must_be_immutable
class DropdownSearchPadrao extends GetView {
  final gb = Get.find<Global>();
  final String label;
  final List<dynamic> listaItens;
  dynamic selecItem;

  DropdownSearchPadrao({
    this.label,
    this.selecItem,
    this.listaItens,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<dynamic>(
      items: listaItens,
      mode: Mode.BOTTOM_SHEET,
      showSearchBox: true,
      showSelectedItem: false,
      popupBackgroundColor: Colors.white,
      label: label,
      dropdownSearchDecoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
        fillColor: gb.primaryLight,
        counterStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
      ),
      dropdownButtonBuilder: (x) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_drop_down,
          size: 24,
          color: gb.secondary,
        ),
      ),
      onChanged: (value) => selecItem = value,
      itemAsString: (item) => item.nome,
      selectedItem: selecItem,
    );
  }
}
