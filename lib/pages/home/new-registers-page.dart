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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              _cardCadastroClientes(),
              _cardCadastroProdutosServicos(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCadastroClientes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: secondaryLight, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: secondaryDark.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context, '/listaClientes');
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                width: double.infinity,
                child: Image.asset(
                  'assets/imagens/backgroud-new-client.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 35.0,
                left: 20.0,
                child: Text(
                  "CLIENTES",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCadastroProdutosServicos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: secondaryLight, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context, '/listaProdutoServico');
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                width: double.infinity,
                child: Image.asset(
                  'assets/imagens/backgroud-new-produto-servico.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 35.0,
                left: 20.0,
                child: Text(
                  "PRODUTOS & SERVIÇOS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
