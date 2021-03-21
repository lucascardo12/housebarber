import 'dart:io';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  File _image;
  final picker = ImagePicker();
  TextEditingController nomeControle = TextEditingController(text: user.nome);
  TextEditingController emailControle = TextEditingController(text: user.email);
  TextEditingController numeroControle =
      TextEditingController(text: user.numero);

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        prefs.setString('foto', pickedFile.path);
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    try {
      _image = File(prefs.getString('foto'));
    } catch (e) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: secondary,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.55,
                color: primaryLight,
                padding: EdgeInsets.only(right: 25, left: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    CampoPadrao(
                      label: "Nome",
                      controler: nomeControle,
                      cor: Colors.white,
                    ),
                    CampoPadrao(
                      controler: emailControle,
                      cor: Colors.white,
                      label: 'E-mail',
                    ),
                    CampoPadrao(
                      label: "Numero",
                      cor: Colors.white,
                      controler: numeroControle,
                    ),
                  ],
                )),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: GestureDetector(
                    onTap: getImage,
                    child: CircleAvatar(
                      backgroundImage:
                          _image != null ? FileImage(_image) : null,
                      backgroundColor: primaryLight,
                      radius: 95,
                      child: _image == null
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: getImage,
                              icon: Icon(
                                Icons.camera_alt,
                                size: 48,
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),
                  ))),
        )
      ],
    ));
  }
}
