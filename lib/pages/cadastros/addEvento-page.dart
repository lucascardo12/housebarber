import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/AddEvento-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:housebarber/widgets/dropdownSearchPadrao-widget.dart';

// ignore: must_be_immutable
class AddEventoPage extends GetView {
  final gb = Get.find<Global>();
  final AddEventoController controller = Get.put(AddEventoController());
  dynamic selectProd;
  AddEventoPage({this.selectProd});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: gb.primaryLight,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Center(
                  child: Text(
                'Cadastro de Agendamento',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
              DropdownSearchPadrao(
                label: 'Cliente',
                listaItens: gb.listadeCliente,
              ),
              DropdownSearchPadrao(
                label: 'Serviço',
                listaItens: gb.listadeProdutoServico,
              ),
              CampoPadrao(
                label: 'Data:',
                cor: Colors.white,
                icone: Icons.calendar_today,
                corIcon: gb.secondary,
                readOnly: true,
              ),
              CampoPadrao(
                label: 'Hora inicio:',
                cor: Colors.white,
                icone: Icons.lock_clock,
                corIcon: gb.secondary,
                readOnly: true,
              ),
              CampoPadrao(
                label: 'Hora Fim:',
                cor: Colors.white,
                icone: Icons.lock_clock,
                corIcon: gb.secondary,
                readOnly: true,
              ),
              ButtonPadrao(
                label: 'Salvar',
                backgroundColor: gb.secondary,
              )
            ],
          ),
        ));
  }
}
