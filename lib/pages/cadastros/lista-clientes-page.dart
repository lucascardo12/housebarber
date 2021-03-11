import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/cliente.dart';

class ListaClientes extends StatefulWidget {
  @override
  _ListaClientestState createState() => _ListaClientestState();
}

class _ListaClientestState extends State<ListaClientes> {
  List<Cliente> listadeCliente = <Cliente>[];
  @override
  void initState() {
    Cliente.getData().then((value) {
      setState(() {
        listadeCliente = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Meus Clientes'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: listadeCliente.length,
          itemBuilder: (context, index) {
            return _buildItem(context, listadeCliente[index]);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/newClient'),
          icon: Icon(Icons.add),
          label: Text('Cliente'),
        ));
  }

  _buildItem(BuildContext context, Cliente cliente) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Card(
        elevation: 4,
        child: Material(
          child: InkWell(
            onTap: () {
              setState(() {
                showSimpleCustomDialog(context, cliente);
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cliente.nome,
                    style: TextStyle(
                      fontFamily: "Myriad Pro",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -.5,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Email:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  cliente.email,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "WhatsApp:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        cliente.numero ?? "",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSimpleCustomDialog(BuildContext context, Cliente cliente) {
    TextEditingController nome = TextEditingController(text: cliente.nome);
    TextEditingController cpf = TextEditingController(text: cliente.cpf);
    TextEditingController email = TextEditingController(text: cliente.email);
    TextEditingController numero = TextEditingController(text: cliente.numero);
    AlertDialog simpleDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      content: Container(
        padding: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nome,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: "Nome:",
                ),
                onChanged: (v) {},
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: cpf,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: "CPF:",
                ),
                onChanged: (v) {},
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: "Email:",
                ),
                onChanged: (v) {},
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: numero,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: "WhatsApp:",
                ),
                onChanged: (v) {},
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'CANCELAR',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(width: 5),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5),
              ),
              color: Colors.green,
              child: Row(
                children: <Widget>[
                  Text(
                    'SALVAR',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                Map<String, dynamic> updateClinente = {
                  'nome': nome.text,
                  'idUser': cliente.idUser,
                  'cpf': cpf.text,
                  'email': email.text,
                  'numero': numero.text,
                  'id': cliente.id,
                };
                _updateCadastroCliente(updateClinente);
                setState(() {
                  Navigator.of(context).pop();
                });
                //Navigator.pushNamed(context, '/listaClientes');
              },
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  void _updateCadastroCliente(updateCliente) {
    // print(cliente.nome);
    setState(() {
      var cliente = new Cliente(
          nome: updateCliente['nome'],
          cpf: updateCliente['cpf'],
          email: updateCliente['email'],
          numero: updateCliente['numero'],
          id: updateCliente['id'],
          idUser: updateCliente['idUser']);
      bacon.insertUpdate(objeto: cliente, tabela: 'Cliente');
    });
  }
}
