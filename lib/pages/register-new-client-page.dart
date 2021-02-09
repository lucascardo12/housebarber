import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';

class RegisterNewClient extends StatefulWidget {
  @override
  _RegisterNewProductState createState() => _RegisterNewProductState();
}

class _RegisterNewProductState extends State<RegisterNewClient> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cpf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Home'),
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
                    return 'Por favor Insira o Nome do Cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: numero,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.phone),
                  labelText: 'Celular *',
                  prefixText: '+55',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Insira o Número do Cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.mail),
                  labelText: 'E-mail *',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Insira o E-mail do Cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: cpf,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.person),
                  labelText: 'CPF *',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor Insira o CPF do Cliente';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Map<String, String> infoArray = {
                      'nome': nome.text,
                      'numero': numero.text,
                      'email': email.text,
                      'cpf': cpf.text,
                    };
                    Customfunctions.verificarConexao().then((value) {
                      if (value && value != null) {
                        Customfunctions.cadastraCliente(
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
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ));
  }
}
