import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/register-new-productService-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';

class RegisterNewProductServicePage extends GetView {
  final gb = Get.find<Global>();
  final RegisterNewProductServiceController controller = Get.put(RegisterNewProductServiceController());
  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) controller.produtoServico = Get.arguments;
    return new Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos e Serviços'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            CampoPadrao(
              label: 'Nome',
              initValue: controller.produtoServico.nome,
              onChanged: (value) => controller.produtoServico.nome = value,
              icone: Icons.person,
            ),
            SizedBox(
              height: 10.0,
            ),
            CampoPadrao(
              label: 'Valor',
              icone: Icons.attach_money_sharp,
              initValue: '${controller.produtoServico.valor}',
              onChanged: (value) => controller.onChangeValor(value),
              keyboardType: TextInputType.number,
              maskPadrao: [
                TextInputMask(
                  mask: '\R!\$! !9+.999,99',
                  reverse: true,
                )
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
