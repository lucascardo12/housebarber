import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';

Future<void> dialogCriaeAlteraEvent(
    {BuildContext context, int horaIni = 0, Agendamento evento, DateTime dataMarcada}) async {
  final gb = Get.find<Global>();
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
  return Get.bottomSheet(Align(
    alignment: Alignment.bottomCenter,
    child: Material(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
      child: Container(
        decoration: BoxDecoration(
          color: gb.primaryLight,
          borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        ),
        height: Get.height / 1.5,
        child: Theme(
          data: new ThemeData(
            indicatorColor: Colors.white,
            cursorColor: Colors.white,
            primaryColor: Colors.white,
          ),
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              Center(
                  child: Text(
                'Cadastro de Agendamento',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              DropdownSearch<Cliente>(
                mode: Mode.BOTTOM_SHEET,
                showSearchBox: true,
                showSelectedItem: false,
                popupBackgroundColor: Colors.white,
                label: 'Cliente',
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  fillColor: gb.primaryLight,
                  counterStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                //onChanged: (value) => selectCli = value,
                dropdownButtonBuilder: (_) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: Color(0xFF2195f2),
                  ),
                ),
                itemAsString: (item) => item.nome,
                //onFind: (text) => Cliente.getData(),
                //selectedItem: selectCli),
              ),
              SizedBox(height: 5.0),
              DropdownSearch<ProdutoServico>(
                mode: Mode.BOTTOM_SHEET,
                showSearchBox: true,
                showSelectedItem: false,
                popupBackgroundColor: Colors.white,
                label: 'Serviço',
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  fillColor: gb.primaryLight,
                  counterStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                dropdownButtonBuilder: (_) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: Color(0xFF2195f2),
                  ),
                ),
                //onChanged: (value) => selectProd = value,
                itemAsString: (item) => item.nome,
                //onFind: (text) => ProdutoServico.getData(),
                //selectedItem: selectProd),
              ),
              TextField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 5),
                    lastDate: DateTime(DateTime.now().year + 5),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.fallback(),
                        child: child,
                      );
                    },
                  ).then((selectedDate) {
                    // if (selectedDate != null) {
                    //   dateControler.text = Customfunctions.stringData(selectedDate);
                    // }
                  });
                },
                //controller: dateControler,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Data:',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    color: gb.secondary,
                  ),
                ),
              ),
              new TextField(
                readOnly: true,
                //controller: horaInicControler,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Hora inicio:',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.lock_clock,
                    color: gb.secondary,
                  ),
                ),
                onTap: () {
                  showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext context, Widget child) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                          child: child,
                        );
                      }).then((selectedDate) {
                    // if (selectedDate != null) {
                    //   horaInicControler.text = Customfunctions.stringHora(selectedDate);
                    // }
                  });
                },
              ),
              new TextField(
                  readOnly: true,
                  //controller: horaFimControler,
                  textAlign: TextAlign.left,
                  onTap: () {
                    showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              alwaysUse24HourFormat: true,
                            ),
                            child: child,
                          );
                        }).then((selectedDate) {
                      // if (selectedDate != null) {
                      //   horaFimControler.text = Customfunctions.stringHora(selectedDate);
                      // }
                    });
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Hora Fim:',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.lock_clock,
                      color: gb.secondary,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 100, right: 100),
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: gb.secondary,
                ),
                onPressed: () async {
                  // var dia = Customfunctions.dataString(data: dateControler.text);
                  // var endTime = DateTime(
                  //     dia.year, dia.month, dia.day, int.parse(horaFimControler.text.substring(0, 2)));
                  // var starTime = DateTime(
                  //     dia.year, dia.month, dia.day, int.parse(horaInicControler.text.substring(0, 2)));
                  // Agendamento auxi = Agendamento(
                  //     id: evento != null ? evento.id : null,
                  //     idUser: user.id,
                  //     idCliente: selectCli.id,
                  //     dia: dia.toString(),
                  //     endTime: endTime,
                  //     startTime: starTime,
                  //     idServico: selectProd.id);

                  // await bacon.insertUpdate(objeto: auxi, tabela: 'Agendamento').then((value) async {
                  //   if (value != null) {
                  //     await Agendamento.getData(selector: {'idUser': user.id})
                  //         .then((value) => listAgenda = value);
                  //   }
                  // });
                  // Get.back();
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
