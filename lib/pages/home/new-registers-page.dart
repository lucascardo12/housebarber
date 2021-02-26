import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';

class NewRegisters extends StatefulWidget {
  @override
  _NewRegisterPageState createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisters> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryLight,
        height: MediaQuery.of(context).size.height - 200,
        child: ListView(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          children: [
            FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              icon: Icon(Icons.person_add, color: Colors.white),
              color: secondary,
              onPressed: () => Navigator.pushNamed(context, '/listaClientes'),
              label: Text(
                'Clientes',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              icon: Icon(Icons.add_box_outlined, color: Colors.white),
              color: secondary,
              onPressed: () =>
                  Navigator.pushNamed(context, '/listaProdutoServico'),
              label: Text('Produto/Serviço',
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ));
  }
}
