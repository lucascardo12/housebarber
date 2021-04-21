import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/login-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:housebarber/widgets/loading-widget.dart';

class SubLoginPage extends GetView {
  final gb = Get.find<Global>();
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.isLoading.value
        ? Loading()
        : Container(
            color: gb.primaryLight,
            child: Theme(
                data: new ThemeData(
                  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
                  primaryColor: Colors.white,
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                        child: Text(
                      'House Barber Shop',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                CampoPadrao(
                                  initValue: controller.userlogin.login,
                                  onChanged: (v) => controller.userlogin.login = v,
                                  icone: Icons.people_alt,
                                  label: "Login:",
                                  cor: Colors.white,
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
                                      prefixIcon: const Icon(
                                        Icons.security,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            controller.showPassword.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.white,
                                          ),
                                          onPressed: () =>
                                              controller.showPassword.value = !controller.showPassword.value),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  onPressed: () => controller.login(),
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 100, right: 100),
                                    elevation: 12,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    backgroundColor: gb.secondary,
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ))));
  }
}
