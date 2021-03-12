import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/controller/register-new-productService-controller.dart';

class RegisterNewProductService extends StatefulWidget {
  @override
  _RegisterNewProductServiceState createState() =>
      _RegisterNewProductServiceState();
}

class _RegisterNewProductServiceState extends State<RegisterNewProductService> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController valor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos e Serviços'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: nome,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person_add),
                labelText: 'Nome *',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor Insira o Nome do Produto';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: valor,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.attach_money_sharp),
                  labelText: 'Valor *',
                  prefixText: '\R\$',
                  suffixText: 'BR',
                  suffixStyle: TextStyle(color: Colors.green)),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor Insira o Valor do Produto ou Serviço';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                color: secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  setState(() {
                    isLoading = !isLoading;
                  });
                  Map<String, dynamic> infoArray = {
                    'nome': nome.text,
                    'valor': valor.text,
                    'idUser': user.id,
                  };
                  if (_formKey.currentState.validate()) {
                    Customfunctions.verificarConexao().then((value) {
                      if (value && value != null) {
                        cadastraProdutoServico(
                                infoArray: infoArray, context: context)
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
                  } else {
                    FlutterToastAlert.showToastAndAlert(
                        type: Type.Warning,
                        androidToast: 'Um ou mais campos são obrigatórios',
                        toastDuration: 5,
                        toastShowIcon: false);
                  }
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
