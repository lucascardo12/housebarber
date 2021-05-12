import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/register-new-client-controller.dart';
import 'package:housebarber/services/global.dart';

class ListaClientes extends GetView {
  final Global gb = Get.find<Global>();
  final RegisterNewClientServiceController controller = Get.put(RegisterNewClientServiceController());

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: gb.listadeCliente.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed('/newClient', arguments: gb.listadeCliente[index]),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gb.listadeCliente[index].nome,
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
                                          gb.listadeCliente[index].email,
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
                                gb.listadeCliente[index].numero ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            color: Colors.red,
                          ),
                          onPressed: () => {}),
                      // onPressed: () => controller.deleta(
                      //     prod: gb.listadeProdutoServico[index]),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        onPressed: () => Get.toNamed('/newClient'),
        icon: Icon(Icons.add),
        label: Text('Cliente'),
      ),
    );
  }
}
