// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:housebarber/services/global.dart';
// import 'package:housebarber/controller/register-new-client-controller.dart';
// import 'package:housebarber/model/cliente.dart';

// class ListaClientes extends GetView {
//   final gb = Get.find<Global>();
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text('Meus Clientes'),
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.only(top: 20),
//         itemCount: gb.listadeCliente.length,
//         itemBuilder: (context, index) {
//           return _buildItem(context, gb.listadeCliente[index]);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         foregroundColor: Colors.white,
//         // onPressed: () => Get.toNamed('/newClient').then((value) => atualizarLista()),
//         icon: Icon(Icons.add),
//         label: Text('Cliente'),
//       ),
//     );
//   }

//   _buildItem(BuildContext context, Cliente cliente) {
//     return Container(
//       padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
//       child: Card(
//         elevation: 4,
//         child: Material(
//           child: InkWell(
//             onTap: () async {
//               //await showSimpleCustomDialog(context, cliente).whenComplete(() => atualizarLista());
//             },
//             child: Container(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     cliente.nome,
//                     style: TextStyle(
//                       fontFamily: "Myriad Pro",
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: -.5,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Row(
//                         children: [
//                           Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "Email:",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 Text(
//                                   cliente.email,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "WhatsApp:",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         cliente.numero ?? "",
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> showSimpleCustomDialog(
//       BuildContext context, Cliente cliente) async {
//     TextEditingController nome = TextEditingController(text: cliente.nome);
//     TextEditingController cpf = TextEditingController(text: cliente.cpf);
//     TextEditingController email = TextEditingController(text: cliente.email);
//     TextEditingController numero = TextEditingController(text: cliente.numero);
//     AlertDialog simpleDialog = AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       content: Container(
//         padding: EdgeInsets.all(5),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 controller: nome,
//                 decoration: InputDecoration(
//                   isDense: false,
//                   labelText: "Nome:",
//                 ),
//                 onChanged: (v) {},
//               ),
//               SizedBox(height: 5),
//               TextFormField(
//                 controller: cpf,
//                 decoration: InputDecoration(
//                   isDense: false,
//                   labelText: "CPF:",
//                 ),
//                 onChanged: (v) {},
//               ),
//               SizedBox(height: 5),
//               TextFormField(
//                 controller: email,
//                 decoration: InputDecoration(
//                   isDense: false,
//                   labelText: "Email:",
//                 ),
//                 onChanged: (v) {},
//               ),
//               SizedBox(height: 5),
//               TextFormField(
//                 controller: numero,
//                 decoration: InputDecoration(
//                   isDense: false,
//                   labelText: "WhatsApp:",
//                 ),
//                 onChanged: (v) {},
//               ),
//               SizedBox(height: 5),
//             ],
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         Row(
//           children: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(5),
//                 ),
//                 backgroundColor: Colors.red,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     'EXCLUIR',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 // Map<String, dynamic> deleteCliente = {
//                 //   '_id': cliente.id,
//                 //   'idUser': user.id,
//                 // };
//                 // excluirCliente(infoArray: deleteCliente, context: context).then((value) {
//                 //   atualizarLista();
//                 //   Navigator.of(context).pop();
//                 // });
//               },
//             ),
//             SizedBox(width: 5),
//             TextButton(
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(5),
//                 ),
//                 backgroundColor: Colors.red,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'CANCELAR',
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//             SizedBox(width: 5),
//             TextButton(
//               style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(5),
//                 ),
//                 backgroundColor: Colors.green,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Text(
//                     'SALVAR',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//               onPressed: () async {
//                 // cliente.nome = nome.text;
//                 // cliente.cpf = cpf.text;
//                 // cliente.email = email.text;
//                 // cliente.numero = numero.text;
//                 // await bacon.insertUpdate(objeto: cliente, tabela: 'Cliente');
//                 // await atualizarLista();
//                 // Navigator.of(context).pop();
//               },
//             ),
//             SizedBox(
//               width: 20,
//             ),
//           ],
//         ),
//       ],
//     );
//     showDialog(
//         context: context, builder: (BuildContext context) => simpleDialog);
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/controller/register-new-client-controller.dart';
import 'package:housebarber/services/global.dart';

class ListaClientes extends GetView {
  final Global gb = Get.find<Global>();
  final RegisterNewClientServiceController controller =
      Get.put(RegisterNewClientServiceController());

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
              onTap: () => Get.toNamed('/newClient',
                  arguments: gb.listadeCliente[index]),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
