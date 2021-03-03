import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/model/produtoServico.dart';

class ListaProdutoServico extends StatefulWidget {
  @override
  _ListaProdutoServicotState createState() => _ListaProdutoServicotState();
}

class _ListaProdutoServicotState extends State<ListaProdutoServico> {
  List<ProdutoServico> listadeProdutoServico = <ProdutoServico>[];
  @override
  void initState() {
    ProdutoServico.getData().then((value) {
      setState(() {
        listadeProdutoServico = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Serviço'),
        ),
        body: ListView.builder(
          itemCount: listadeProdutoServico.length,
          itemBuilder: (context, index) {
            return ListTile(
              subtitle: Text(listadeProdutoServico[index].valor),
              title: Text(listadeProdutoServico[index].nome),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/newProductService'),
          icon: Icon(Icons.add),
          label: Text('Incluir Produto/Servico'),
        ));
  }
}
