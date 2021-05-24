import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/Settings-controller.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/button-padrao.dart';
import 'package:housebarber/widgets/campoPadrao.dart';

class SettingsPage extends GetView {
  final gb = Get.find<Global>();
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        Container(
          color: gb.primary,
          width: Get.width,
          height: Get.height * 0.25,
          child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Configurações',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        Center(
          child: ListView(
            padding:
                EdgeInsets.only(top: Get.height * 0.10, left: 15, right: 15),
            children: [
              GestureDetector(
                  onLongPress: () => controller.image = null,
                  onTap: controller.getImage,
                  child: new Center(
                      child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 85,
                    child: Obx(() => CircleAvatar(
                          backgroundImage:
                              controller.image.value.path.isNotEmpty
                                  ? FileImage(controller.image.value)
                                  : null,
                          radius: 78.0,
                          child: controller.image.value.path.isEmpty
                              ? IconButton(
                                  iconSize: 48,
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 48,
                                    color: gb.secondary,
                                  ),
                                  onPressed: controller.getImage,
                                )
                              : null,
                          backgroundColor: Colors.white,
                        )),
                  ))),
              SizedBox(
                height: Get.height * 0.05,
              ),
              CampoPadrao(
                initValue: gb.user.nome,
                onChanged: (value) => gb.user.nome = value,
                label: "Nome",
                cor: Colors.white,
              ),
              CampoPadrao(
                initValue: gb.user.email,
                onChanged: (value) => gb.user.email = value,
                cor: Colors.white,
                label: 'E-mail',
              ),
              CampoPadrao(
                initValue: gb.user.numero,
                onChanged: (value) => gb.user.numero = value,
                label: "Numero",
                maskPadrao: [
                  TextInputMask(
                    mask: '(99) 9 9999-9999',
                    reverse: false,
                  ),
                ],
                cor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login Automático",
                    style: TextStyle(color: Colors.white),
                  ),
                  Obx(
                    () => Switch(
                      activeColor: gb.secondaryLight,
                      value: controller.autoLogin.value,
                      onChanged: (value) => controller.loginAutomatico(value),
                    ),
                  ),
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Sair',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () => Get.offAllNamed('/login'),
              ),
              Text(
                gb.version,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              ButtonPadrao(
                label: 'Salvar',
                onPressed: () => controller.salvar(),
              )
            ],
          ),
        )
      ]),
    );
  }
}
