import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';

class NewRegistersPage extends GetView {
  // @override
  // void initState() {
  //   atualizarLista();
  //   super.initState();
  // }

  // Future<void> atualizarLista() async {
  //   setState(() {});
  // }
  final gb = Get.find<Global>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          //await atualizarLista();
        },
        child: Container(
          color: gb.primaryLight,
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: gb.secondaryLight, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      splashColor: gb.secondaryDark.withAlpha(30),
                      onTap: () => Get.toNamed('/listaClientes'),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: Center(
                            child: Text(
                          "Clientes",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48.0, color: Colors.amber),
                        )),
                        decoration: new BoxDecoration(
                          color: gb.primaryLight,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter:
                                new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                            image: AssetImage('assets/imagens/backgroud-new-client.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: gb.secondaryLight, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      splashColor: gb.secondaryDark.withAlpha(30),
                      onTap: () => Get.toNamed('/listaProdutoServico'),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: Center(
                          child: Text(
                            "Produtos \n& \nServiços",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 42.0,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          color: gb.primaryLight,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter:
                                new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                            image: AssetImage('assets/imagens/backgroud-new-produto-servico.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
