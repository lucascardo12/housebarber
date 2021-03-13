import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housebarber/config/custom-colors.dart';

class NewRegisters extends StatefulWidget {
  @override
  _NewRegisterPageState createState() => _NewRegisterPageState();
}

class _NewRegisterPageState extends State<NewRegisters> {
  @override
  void initState() {
    atualizarLista();
    super.initState();
  }

  Future<void> atualizarLista() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await atualizarLista();
        },
        child: Container(
          color: primaryLight,
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
          child: Container(
            width: double.infinity,
            height: 200,
            child: Center(
                child: Text(
              "Clientes",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48.0,
                  color: Colors.amber),
            )),
            decoration: new BoxDecoration(
              color: primaryLight,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/imagens/backgroud-new-client.jpg'),
              ),
            ),
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
          splashColor: secondaryDark.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context, '/listaProdutoServico');
          },
          child: Container(
            width: double.infinity,
            height: 200,
            child: Center(
              child: Text(
                "Produtos \n& \nServiços",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42.0,
                  color: Colors.amber,
                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: primaryLight,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage(
                    'assets/imagens/backgroud-new-produto-servico.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
