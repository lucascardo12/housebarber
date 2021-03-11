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
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(15),
          child: _cardCadastroClientes(),
        )
      ],
    );
  }

  Widget _cardCadastroClientes() {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(context, '/newClient');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/imagens/backgroud-new-client.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: 10.0,
                right: 10.0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cadastro de Clientes',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white, fontSize: 60),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCadastroProdutosServicos() {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card Cadastro de Cliente');
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  'assets/imagens/backgroud-new-produto-servico.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: 10.0,
                right: 10.0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cadastro de Clientes',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white, fontSize: 60),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
