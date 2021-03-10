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
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(20, (index) {
        return Container(
          padding: EdgeInsets.all(15),
          child: _buildCards(),
        );
      }),
    );
  }

  Widget _buildCards() {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card Cadastro de Cliente');
        },
        child: Container(
          width: double.infinity,
          height: 100,
          child: Text('A card that can be tapped'),
        ),
      ),
    );
  }
}
