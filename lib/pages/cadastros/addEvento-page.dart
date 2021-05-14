import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/AddEvento-controller.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/services/custom-functions.dart';
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
    controller.inicia();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                agenda.id != null
                    ? IconButton(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                        onPressed: () =>
                            controller.deletaEvento(agenda: agenda))
                    : IconButton(
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.transparent,
                        ),
                        onPressed: () {}),
                Text(
                  'Cadastro de Agendamento',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.transparent,
                    ),
                    onPressed: () {}),
              ],
            ),
            DropdownSearchPadrao(
              label: 'Cliente',
              selecItem: controller.selectCliente,
              listaItens: gb.listadeCliente,
              onChanged: (value) => controller.selectCliente = value,
            ),
            DropdownSearchPadrao(
              label: 'Serviço',
              selecItem: controller.selectProduto,
              listaItens: gb.listadeProdutoServico,
              onChanged: (value) => controller.selectProduto = value,
            ),
            CampoPadrao(
              label: 'Data:',
              cor: Colors.white,
              icone: Icons.calendar_today,
              corIcon: gb.secondary,
              controler: controller.dataControl,
              readOnly: true,
              onTap: () async => controller.dataControl.text =
                  await controller.addDataTime(date: true),
            ),
            CampoPadrao(
              label: 'Hora inicio:',
              cor: Colors.white,
              icone: Icons.lock_clock,
              corIcon: gb.secondary,
              controler: controller.inicioControl,
              readOnly: true,
              onTap: () async => controller.inicioControl.text =
                  await controller.addDataTime(date: false),
            ),
            CampoPadrao(
              label: 'Hora Fim:',
              cor: Colors.white,
              icone: Icons.lock_clock,
              corIcon: gb.secondary,
              readOnly: true,
              controler: controller.fimControl,
              onTap: () async => controller.fimControl.text =
                  await controller.addDataTime(date: false),
            ),
            ButtonPadrao(
              label: 'Salvar',
              backgroundColor: gb.secondary,
              onPressed: () => controller.salvar(),
            )
          ],
        ),
      ),
    );
  }
}
