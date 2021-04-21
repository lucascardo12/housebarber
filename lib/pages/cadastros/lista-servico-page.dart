import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/custom-functions.dart';
import 'package:housebarber/services/global.dart';

class ListaProdutoServicoPage extends GetView {
  final gb = Get.find<Global>();

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Produtos e Serviços'),
        ),
        body: Obx(() => ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: gb.listadeProdutoServico.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () =>
                        Get.toNamed('/newProductService', arguments: gb.listadeProdutoServico[index]),
                    child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gb.listadeProdutoServico[index].nome,
                                style: TextStyle(
                                  fontFamily: "Myriad Pro",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Valor: ${Customfunctions.moneyFormat(gb.listadeProdutoServico[index].valor)}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        )));
              },
            )),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () => Get.toNamed('/newProductService'),
          icon: Icon(Icons.add),
          label: Text('Produto/Serviço'),
        ));
  }
}
