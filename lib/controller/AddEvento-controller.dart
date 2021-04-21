import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  // TextEditingController dateControler = TextEditingController();
  // TextEditingController horaInicControler = TextEditingController();
  // TextEditingController horaFimControler = TextEditingController();
  // Cliente selectCli;
  // ProdutoServico selectProd;
  // horaInicControler.text = horaIni.toString().padLeft(2, '0') + ':00';
  // dateControler.text = dataMarcada != null ? DateFormat('dd/MM/yyyy').format(dataMarcada) : "";

  // if (evento != null) {
  //   horaInicControler.text = DateFormat('kk:mm').format(evento.startTime);
  //   horaFimControler.text = DateFormat('kk:mm').format(evento.endTime);
  //   dateControler.text = DateFormat('dd/MM/yyyy').format(evento.endTime);
  //   await Cliente.getData(selector: {"_id": evento.idCliente}).then((value) => selectCli = value.first);
  //   await ProdutoServico.getData(selector: {"_id": evento.idServico})
  //       .then((value) => selectProd = value.first);
  // }
//   //
//   //  showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(DateTime.now().year - 5),
//                     lastDate: DateTime(DateTime.now().year + 5),
//                     builder: (BuildContext context, Widget child) {
//                       return Theme(
//                         data: ThemeData.dark(),
//                         child: child,
//                       );
//                     },
//                   ).then((selectedDate) {
//                     // if (selectedDate != null) {
//                     //   dateControler.text = Customfunctions.stringData(selectedDate);
//                     // }
//                   });
// }
// //
// // howTimePicker(
//                       context: context,
//                       initialTime: TimeOfDay.now(),
//                       builder: (BuildContext context, Widget child) {
//                         return MediaQuery(
//                           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
//                           child: child,
//                         );
//                       }).then((selectedDate) {
//                     // if (selectedDate != null) {
//                     //   horaInicControler.text = Customfunctions.stringHora(selectedDate);
//                     // }
//                   });
//
// //  showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                         builder: (BuildContext context, Widget child) {
//                           return MediaQuery(
//                             data: MediaQuery.of(context).copyWith(
//                               alwaysUse24HourFormat: true,
//                             ),
//                             child: child,
//                           );
//                         }).then((selectedDate) {
//                       // if (selectedDate != null) {
//                       //   horaFimControler.text = Customfunctions.stringHora(selectedDate);
//                       // }
//                     });
}
