import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/widgets/campoPadrao.dart';

class SettingsPage extends GetView {
  final gb = Get.find<Global>();
  // File _image;
  // final picker = ImagePicker();
  // TextEditingController nomeControle = TextEditingController(text: user.nome);
  // TextEditingController emailControle = TextEditingController(text: user.email);
  // TextEditingController numeroControle =
  //     TextEditingController(text: user.numero);

  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       prefs.setString('foto', pickedFile.path);
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   try {
  //     _image = File(prefs.getString('foto'));
  //   } catch (e) {}
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        ListView(
          children: [
            Container(
              height: Get.height * 0.3,
              color: gb.secondary,
            ),
            Container(
                height: Get.height * 0.55,
                color: gb.primaryLight,
                padding: EdgeInsets.only(right: 25, left: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.15,
                    ),
                    CampoPadrao(
                      label: "Nome",
                      //controler: gbnomeControle,
                      cor: Colors.white,
                    ),
                    CampoPadrao(
                      //controler: emailControle,
                      cor: Colors.white,
                      label: 'E-mail',
                    ),
                    CampoPadrao(
                      label: "Numero",
                      cor: Colors.white,
                      //controler: numeroControle,
                    ),
                  ],
                )),
          ],
        ),
        Container(
          height: Get.width * 0.5,
          child: Center(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: GestureDetector(
                    //onTap: getImage,
                    child: CircleAvatar(
                      //backgroundImage: _image != null ? FileImage(_image) : null,
                      backgroundColor: gb.primaryLight,
                      radius: 95,
                      // child: _image == null
                      //     ? IconButton(
                      //         padding: EdgeInsets.zero,
                      //         //onPressed: getImage,
                      //         icon: Icon(
                      //           Icons.camera_alt,
                      //           size: 48,
                      //           color: Colors.white,
                      //         ),
                      //       )
                      //     : null,
                    ),
                  ))),
        )
      ],
    ));
  }
}
