import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/global.dart';
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

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Produtos e Serviços'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: listadeProdutoServico.length,
          itemBuilder: (context, index) {
            return _buildItem(context, listadeProdutoServico[index]);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/newProductService'),
          icon: Icon(Icons.add),
          label: Text('Produto/Serviço'),
        ));
  }

  _buildItem(BuildContext context, ProdutoServico produtoServico) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Card(
        elevation: 4,
        child: Material(
          child: InkWell(
            onTap: () {
              setState(() {
                showSimpleCustomDialog(context, produtoServico);
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    produtoServico.nome,
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
                                  "Valor R\$: ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  produtoServico.valor,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSimpleCustomDialog(
      BuildContext context, ProdutoServico produtoServico) {
    TextEditingController nome =
        TextEditingController(text: produtoServico.nome);
    TextEditingController valor =
        TextEditingController(text: produtoServico.valor);
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
                controller: valor,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: "Valor R\$: ",
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
                Map<String, dynamic> updateProdutoServico = {
                  'nome': nome.text,
                  'id': produtoServico.id,
                  'valor': valor.text,
                };
                _updateProdutoServico(updateProdutoServico);
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

  void _updateProdutoServico(updateProdutoServico) {
    // print(produtoServico.nome);
    var produtoServico = new ProdutoServico(
        nome: updateProdutoServico['nome'],
        valor: updateProdutoServico['valor'],
        id: updateProdutoServico['id']);
    bacon.insertUpdate(objeto: produtoServico, tabela: 'ProdutoServico');
  }
}
