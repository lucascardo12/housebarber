import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          title: Text('Clientes'),
        ),
        body: ListView.builder(
          itemCount: listadeCliente.length,
          itemBuilder: (context, index) {
            return ListTile(
              subtitle: Text(listadeCliente[index].email),
              title: Text(listadeCliente[index].nome),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/newClient'),
          icon: Icon(Icons.add),
          label: Text('Incluir Cliente'),
        ));
  }
}
