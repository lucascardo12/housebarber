import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:image_picker/image_picker.dart';

class SettingsController extends GetxController {
  Rx<File> image = Rx(File(''));
  final picker = ImagePicker();
  final MongoDB db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  RxBool autoLogin = true.obs;

  @override
  void onInit() {
    super.onInit();
    String path = gb.box.get(
      'image',
      defaultValue: '',
    );
    autoLogin.value = gb.box.get(
      "autoLogin",
      defaultValue: true,
    );
    if (path.isNotEmpty) image.value = File(path);
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      gb.box.put('image', image.value.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> salvar() async {
    await db.insertUpdate(tabela: "User", objeto: gb.user).then(
      (value) {
        if (value != null)
          Get.snackbar('Sucesso', "Usuário alterado com sucesso!",
              duration: Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
              isDismissible: true,
              dismissDirection: SnackDismissDirection.HORIZONTAL,
              backgroundColor: Colors.white);
      },
    );
  }

  Future<void> loginAutomatico(bool v) async {
    await gb.box.put("autoLogin", v);
    autoLogin.value = v;
  }
}
