import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/login-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:url_launcher/url_launcher.dart';

class SubLoginPage extends GetView {
  final gb = Get.find<Global>();
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    controller.formKey = GlobalKey<FormState>();
    return Container(
      color: gb.primaryLight,
      child: ListView(
        children: [
          SizedBox(
            height: 80,
          ),
          Center(
              child: Text(
            'Barbudos Agendamento',
            style: TextStyle(color: gb.secondaryLight, fontSize: 20, fontWeight: FontWeight.bold),
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
                        'Login',
                        style: TextStyle(color: gb.secondaryLight, fontSize: 32, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  CampoPadrao(
                    initValue: controller.userlogin.login,
                    onChanged: (v) => controller.userlogin.login = v,
                    icone: Icons.people_alt,
                    label: "Login:",
                    corLabel: gb.secondaryLight,
                    cor: Colors.white,
                    corIcon: gb.secondaryLight,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextFormField(
                      obscureText: !controller.showPassword.value,
                      style: TextStyle(color: Colors.white),
                      initialValue: controller.userlogin.senha,
                      onChanged: (value) => controller.userlogin.senha = value,
                      validator: (value) => controller.validaCampo(value, "Senha"),
                      decoration: InputDecoration(
                        labelText: 'Senha:',
                        labelStyle: TextStyle(color: gb.secondaryLight, fontSize: 16),
                        prefixIcon: Icon(
                          Icons.security,
                          color: gb.secondaryLight,
                          size: 28,
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              controller.showPassword.value ? Icons.visibility : Icons.visibility_off,
                              color: gb.secondaryLight,
                            ),
                            onPressed: () => controller.showPassword.value = !controller.showPassword.value),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(style: TextStyle(color: Colors.white), text: "Esqueci minha senha "),
                        TextSpan(
                          style: TextStyle(color: Colors.blue),
                          text: " Click aqui",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              var url = "https://pub.dev/packages/url_launcher";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonPadrao(
                    label: 'Entrar',
                    onPressed: () => controller.login(),
                    backgroundColor: gb.secondary,
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
