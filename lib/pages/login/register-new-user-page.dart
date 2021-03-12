import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/custom-widgets.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/widgets/campoPadrao.dart';
import 'package:housebarber/controller/register-new-user-controller.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  int tipoUser = 1;
  TextEditingController nomeController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController cpfcnpjController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CustomWidgets.loading()
        : Container(
            color: secondary,
            child: Theme(
                data: new ThemeData(
                  cursorColor: Colors.white,
                  primaryColor: Colors.white,
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Text(
                      'House Barber Shop',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Cadastro',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            CampoPadrao(
                                icone: Icons.people_alt,
                                controler: nomeController,
                                label: "Nome:",
                                cor: Colors.white),
                            SizedBox(
                              height: 20,
                            ),
                            CampoPadrao(
                                icone: Icons.people_alt,
                                controler: usuarioController,
                                label: "Usuario:",
                                cor: Colors.white),
                            TextField(
                              cursorColor: Colors.white,
                              obscureText: !_showPassword,
                              controller: senhaController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Senha:',
                                prefixIcon: const Icon(
                                  Icons.security,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: _showPassword
                                        ? Colors.white
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(
                                        () => _showPassword = !_showPassword);
                                  },
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CampoPadrao(
                                icone: Icons.phone,
                                controler: numeroController,
                                label: "Numero:",
                                cor: Colors.white),
                            SizedBox(
                              height: 20,
                            ),
                            CampoPadrao(
                                icone: Icons.people_alt,
                                controler: cpfcnpjController,
                                label: "CPF/CNPJ:",
                                cor: Colors.white),
                            SizedBox(
                              height: 20,
                            ),
                            CampoPadrao(
                                icone: Icons.email,
                                controler: emailController,
                                label: "E-mail:",
                                cor: Colors.white),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 100, right: 100),
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              color: primary,
                              onPressed: () {
                                setState(() {
                                  isLoading = !isLoading;
                                });
                                Map<String, String> infoArray = {
                                  'nome': nomeController.text,
                                  'usuario': usuarioController.text,
                                  'senha': Customfunctions.textToMd5(
                                      senhaController.text),
                                  'numero': numeroController.text,
                                  'cpfcnpj': cpfcnpjController.text,
                                  'email': emailController.text,
                                };
                                Customfunctions.verificarConexao()
                                    .then((value) {
                                  if (value && value != null) {
                                    validaCadastro(
                                            infoArray: infoArray,
                                            context: context)
                                        .then((value) {
                                      setState(() {
                                        isLoading = !isLoading;
                                      });
                                    });
                                  } else {
                                    setState(() {
                                      isLoading = !isLoading;
                                    });
                                  }
                                });
                              },
                              child: Text(
                                'Registrar',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        )),
                  ],
                )));
  }
}
