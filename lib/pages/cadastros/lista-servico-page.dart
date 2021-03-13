import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/controller/register-new-productService-controller.dart';
import 'package:housebarber/model/produtoServico.dart';

class ListaProdutoServico extends StatefulWidget {
  @override
  _ListaProdutoServicotState createState() => _ListaProdutoServicotState();
}

class _ListaProdutoServicotState extends State<ListaProdutoServico> {
  List<ProdutoServico> listadeProdutoServico = <ProdutoServico>[];
  @override
  void initState() {
    atualizarLista();
    super.initState();
  }

  Future<void> atualizarLista() async {
    await ProdutoServico.getData(selector: {'idUser': user.id}).then(
      (value) {
        setState(() {
          listadeProdutoServico = value;
        });
      },
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Produtos e Serviços'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await atualizarLista();
          },
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: listadeProdutoServico.length,
            itemBuilder: (context, index) {
              return _buildItem(context, listadeProdutoServico[index]);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/newProductService')
              .then((value) => atualizarLista()),
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
            onTap: () async {
              await showSimpleCustomDialog(context, produtoServico)
                  .whenComplete(() => atualizarLista());
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

  Future<void> showSimpleCustomDialog(
      BuildContext context, ProdutoServico produtoServico) async {
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
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5),
              ),
              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Text(
                    'EXCLUIR',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                Map<String, dynamic> deleteProdutoServico = {
                  '_id': produtoServico.id,
                  'idUser': user.id,
                };
                excluirProdutoServico(
                        infoArray: deleteProdutoServico, context: context)
                    .then((value) {
                  atualizarLista();
                  Navigator.of(context).pop();
                });
              },
            ),
            SizedBox(width: 5),
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
              onPressed: () async {
                produtoServico.nome = nome.text;
                produtoServico.valor = valor.text;
                await bacon.insertUpdate(
                    objeto: produtoServico, tabela: 'ProdutoServico');
                await atualizarLista();
                Navigator.of(context).pop();
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
}
