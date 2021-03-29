import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/config/custom-functions.dart';
import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';
import 'package:intl/intl.dart';

Future<void> dialogCriaeAlteraEvent(
    {BuildContext context,
    int horaIni = 0,
    Agendamento evento,
    DateTime dataMarcada}) async {
  TextEditingController dateControler = TextEditingController();
  TextEditingController horaInicControler = TextEditingController();
  TextEditingController horaFimControler = TextEditingController();
  TextEditingController clienteControler = TextEditingController();
  TextEditingController servicoControler = TextEditingController();
  Cliente select;
  ProdutoServico select2;
  horaInicControler.text = horaIni.toString().padLeft(2, '0') + ':00';
  dateControler.text =
      dataMarcada != null ? DateFormat('dd/MM/yyyy').format(dataMarcada) : "";

  if (evento != null) {
    horaInicControler.text = DateFormat('kk:mm').format(evento.startTime);
    horaFimControler.text = DateFormat('kk:mm').format(evento.endTime);
    dateControler.text = DateFormat('dd/MM/yyyy').format(evento.endTime);
    clienteControler.text = evento.idCliente;
    servicoControler.text = evento.servico;
  }
  return showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 400),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          //color: primaryLight,
          child: Container(
            decoration: BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ),
            height: MediaQuery.of(context).size.height / 1.5,
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
                      searchBoxController: clienteControler,
                      dropdownSearchDecoration: InputDecoration(
                        //filled = true para decorar o input
                        filled: true,
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.white,
                        //   ),
                        // ),
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                        fillColor: primaryLight,
                        counterStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      onChanged: (value) {
                        clienteControler.text = value.id.toString();
                        select = value;
                      },
                      dropdownButtonBuilder: (_) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 24,
                              color: Color(0xFF2195f2),
                            ),
                          ),
                      itemAsString: (item) => item.nome,
                      onFind: (text) => Cliente.getData(),
                      selectedItem: select),
                  SizedBox(height: 5.0),
                  DropdownSearch<ProdutoServico>(
                      mode: Mode.BOTTOM_SHEET,
                      showSearchBox: true,
                      showSelectedItem: false,
                      popupBackgroundColor: Colors.white,
                      label: 'Serviço',
                      searchBoxController: servicoControler,
                      dropdownSearchDecoration: InputDecoration(
                        //filled = true para decorar o input
                        filled: true,
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: Colors.transparent,
                        //   ),
                        // ),
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                        fillColor: primaryLight,
                        counterStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      dropdownButtonBuilder: (_) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 24,
                              color: Color(0xFF2195f2),
                            ),
                          ),
                      onChanged: (value) {
                        servicoControler.text = value.id.toString();
                        select2 = value;
                      },
                      itemAsString: (item) => item.nome,
                      onFind: (text) => ProdutoServico.getData(),
                      selectedItem: select2),
                  new TextField(
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
                        if (selectedDate != null) {
                          dateControler.text =
                              Customfunctions.stringData(selectedDate);
                        }
                      });
                    },
                    controller: dateControler,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Data:',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: secondary,
                      ),
                    ),
                  ),
                  new TextField(
                    readOnly: true,
                    controller: horaInicControler,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Hora inicio:',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.lock_clock,
                        color: secondary,
                      ),
                    ),
                    onTap: () {
                      showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child,
                            );
                          }).then((selectedDate) {
                        if (selectedDate != null) {
                          horaInicControler.text =
                              Customfunctions.stringHora(selectedDate);
                        }
                      });
                    },
                  ),
                  new TextField(
                      readOnly: true,
                      controller: horaFimControler,
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
                          if (selectedDate != null) {
                            horaFimControler.text =
                                Customfunctions.stringHora(selectedDate);
                          }
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
                          color: secondary,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                        top: 5, bottom: 5, left: 100, right: 100),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: secondary,
                    onPressed: () async {
                      var dia =
                          Customfunctions.dataString(data: dateControler.text);
                      var endTime = DateTime(dia.year, dia.month, dia.day,
                          int.parse(horaFimControler.text.substring(0, 2)));
                      var starTime = DateTime(dia.year, dia.month, dia.day,
                          int.parse(horaInicControler.text.substring(0, 2)));
                      Agendamento auxi = Agendamento(
                          id: evento != null ? evento.id : null,
                          idUser: user.id,
                          idCliente: clienteControler.text,
                          dia: dia.toString(),
                          endTime: endTime,
                          startTime: starTime,
                          servico: servicoControler.text);

                      await bacon
                          .insertUpdate(objeto: auxi, tabela: 'Agendamento')
                          .then((value) async {
                        if (value != null) {
                          await Agendamento.getData(
                                  selector: {'idUser': user.id})
                              .then((value) => listAgenda = value);
                        }
                      });
                      Navigator.pop(context);
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
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
