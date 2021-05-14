import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/register-new-client-controller.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';

class RegisterNewClientPage extends GetView {
  final gb = Get.find<Global>();
  final RegisterNewClientServiceController controller = Get.find<RegisterNewClientServiceController>();

  @override
  Widget build(BuildContext context) {
    Get.arguments != null ? controller.cliente = Get.arguments : controller.cliente = Cliente();

    return new Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cliente'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            CampoPadrao(
              label: 'Nome',
              initValue: controller.cliente.nome,
              onChanged: (value) => controller.cliente.nome = value,
              icone: Icons.person,
            ),
            SizedBox(
              height: 10.0,
            ),
            CampoPadrao(
              icone: Icons.phone,
              label: "Numero:",
              initValue: controller.cliente.numero,
              onChanged: (value) => controller.cliente.numero = value,
              maskPadrao: [TextInputMask(mask: '(99) 9 9999-9999', reverse: false)],
            ),
            SizedBox(
              height: 10,
            ),
            CampoPadrao(
              icone: Icons.email,
              label: "E-mail:",
              initValue: controller.cliente.email,
              onChanged: (value) => controller.cliente.email = value,
              validator: (value) => controller.validaEmail(value),
            ),
            SizedBox(
              height: 10,
            ),
            CampoPadrao(
              icone: Icons.people_alt,
              label: "CPF/CNPJ:",
              initValue: controller.cliente.cpf,
              onChanged: (value) => controller.cliente.cpf = value,
              validator: (value) => controller.validaCpfCnpj(value),
              maskPadrao: [
                TextInputMask(mask: ['999.999.999-99', '99.999.999/9999-99'])
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ButtonPadrao(
              label: 'Salvar',
              backgroundColor: gb.secondary,
              onPressed: () => controller.salvaAltera(),
            )
          ],
        ),
      ),
    );
  }
}
