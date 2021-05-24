import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:housebarber/controller/register-new-user-controller.dart';

class CadastroPage extends GetView {
  final gb = Get.find<Global>();
  final RegisterNewUserController controller =
      Get.put(RegisterNewUserController());

  @override
  Widget build(BuildContext context) {
    controller.formKey = GlobalKey<FormState>();
    return Container(
      color: gb.secondary,
      child: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            'Barbudos Agendamento',
            style: TextStyle(
                color: gb.primaryLight,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                            color: gb.primaryLight,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  CampoPadrao(
                    icone: Icons.people_alt,
                    label: "Nome:",
                    cor: Colors.white,
                    corLabel: gb.primaryLight,
                    corIcon: gb.primaryLight,
                    onChanged: (value) => controller.userRegister.nome = value,
                  ),
                  CampoPadrao(
                    icone: Icons.people_alt,
                    label: "Login:",
                    cor: Colors.white,
                    corIcon: gb.primaryLight,
                    corLabel: gb.primaryLight,
                    onChanged: (value) => controller.userRegister.login = value,
                    validator: (v) => controller.loginValido(v),
                  ),
                  Obx(
                    () => TextFormField(
                      cursorColor: Colors.white,
                      obscureText: !controller.showPassword.value,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) =>
                          controller.userRegister.senha = value,
                      validator: (value) =>
                          controller.validaCampo(value, 'Senha'),
                      decoration: InputDecoration(
                        labelText: 'Senha:',
                        prefixIcon: Icon(
                          Icons.security,
                          color: gb.primaryLight,
                          size: 28,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: gb.primaryLight,
                          ),
                          onPressed: () => controller.showPassword.value =
                              !controller.showPassword.value,
                        ),
                        labelStyle: TextStyle(
                          color: gb.primaryLight,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CampoPadrao(
                    corIcon: gb.primaryLight,
                    icone: Icons.phone,
                    label: "Numero:",
                    corLabel: gb.primaryLight,
                    onChanged: (value) =>
                        controller.userRegister.numero = value,
                    cor: Colors.white,
                    maskPadrao: [
                      TextInputMask(mask: '(99) 9 9999-9999', reverse: false)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CampoPadrao(
                    corIcon: gb.primaryLight,
                    icone: Icons.people_alt,
                    corLabel: gb.primaryLight,
                    label: "CPF/CNPJ:",
                    onChanged: (value) => controller.userRegister.cnpj = value,
                    cor: Colors.white,
                    validator: (String value) {
                      if (value.isNotEmpty) controller.validaCpfCnpj(value);
                    },
                    maskPadrao: [
                      TextInputMask(
                          mask: ['999.999.999-99', '99.999.999/9999-99'])
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CampoPadrao(
                    corIcon: gb.primaryLight,
                    icone: Icons.email,
                    label: "E-mail:",
                    corLabel: gb.primaryLight,
                    onChanged: (value) => controller.userRegister.email = value,
                    cor: Colors.white,
                    validator: (value) => controller.validaEmail(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonPadrao(
                    label: 'Registrar',
                    onPressed: () => controller.cadastro(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
