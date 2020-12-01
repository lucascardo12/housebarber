import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';

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
    return Container(
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
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: nomeController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Nome:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: usuarioController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Usuario:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        TextField(
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
                                color:
                                    _showPassword ? Colors.white : Colors.white,
                              ),
                              onPressed: () {
                                setState(() => _showPassword = !_showPassword);
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
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: numeroController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "Numero:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: cpfcnpjController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.people_alt,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "CPF/CNPJ:",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 28,
                              ),
                              labelText: "E-mail:",
                              hintStyle: TextStyle(color: Colors.white),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                    isExpanded: true,
                                    dropdownColor: secondary,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                    value: tipoUser ?? 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "Empresa",
                                        ),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("Funcionario"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                          child: Text("Cliente"), value: 3),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        tipoUser = value;
                                      });
                                    }))),
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
                            Map<String, String> infoArray = {
                              'nome': nomeController.text,
                              'usuario': usuarioController.text,
                              'senha': senhaController.text,
                              'numero': numeroController.text,
                              'cpfcnpj': cpfcnpjController.text,
                              'email': emailController.text,
                              'tipoUser': tipoUser.toString()
                            };
                            Customfunctions.validaCadastro(
                                infoArray: infoArray);
                          },
                          child: Text(
                            'Registrar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ],
            )));
  }
}
