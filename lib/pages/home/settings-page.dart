import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/model/user.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import '../../config/global.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => openDrawer());
  }

  void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.nome),
              accountEmail: Text(user.email),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Container(child: ImagePickerExample());
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open"),
          onPressed: () {
            openDrawer();
          },
        ),
      ),
    );
  }
}

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key key}) : super(key: key);

  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File _imageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryLight,
      child: ListView(
        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => {},
                tooltip: 'Shoot picture',
              ),
              IconButton(
                icon: const Icon(Icons.photo_camera),
                onPressed: () async => _pickImageFromCamera(),
                tooltip: 'Shoot picture',
              ),
              IconButton(
                icon: const Icon(Icons.photo),
                onPressed: () async => _pickImageFromGallery(),
                tooltip: 'Pick from gallery',
              ),
            ],
          ),
          if (this._imageFile == null)
            const Placeholder()
          else
            Image.file(this._imageFile),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  Future<void> _pickImageFromCamera() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.camera);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  // void _safeAvatar() {
  //   String newFileName = "my-image";
  //   File imageFile = new File(_imageFile.path);
  //   mongo.GridFS gfsPhoto = new mongo.GridFS(db, "photo");
  //   mongo.GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);
  //   gfsFile.setFilename(newFileName);

  //   List<int> imageBytes = widget.fileData.readAsBytesSync();
  //   print(imageBytes);
  //   String base64Image = base64Encode(imageBytes);

  //   var _newUser = User(
  //       id: user.id,
  //       cnpj: user.cnpj,
  //       email: user.email,
  //       login: user.login,
  //       nome: user.nome,
  //       numero: user.numero,
  //       tipoUser: user.tipoUser,
  //       senha: user.senha,
  //       avatar: _imageFile);
  //   bacon.insertUpdate(objeto: _newUser, tabela: "User");
  //   Navigator.of(context).pop();
  // }
}
