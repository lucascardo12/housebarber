import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/AddEvento-controller.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:housebarber/widgets/dropdownSearchPadrao-widget.dart';

class AddEventoPage extends GetView {
  final gb = Get.find<Global>();
  final AddEventoController controller = Get.put(AddEventoController());
  final Agendamento agenda;
  AddEventoPage({this.agenda});

  @override
  Widget build(BuildContext context) {
    controller.agendamento = agenda;
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
            padding: EdgeInsets.all(20),
            children: [
              Center(
                  child: Text(
                'Cadastro de Agendamento',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
              DropdownSearchPadrao(
                label: 'Cliente',
                selecItem: controller.selectCliente,
                listaItens: gb.listadeCliente,
              ),
              DropdownSearchPadrao(
                label: 'Serviço',
                selecItem: controller.selectProduto,
                listaItens: gb.listadeProdutoServico,
              ),
              CampoPadrao(
                label: 'Data:',
                cor: Colors.white,
                icone: Icons.calendar_today,
                corIcon: gb.secondary,
                readOnly: true,
                //initValue: agendamento,
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
