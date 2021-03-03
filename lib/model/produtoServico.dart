import 'package:housebarber/config/global.dart';

class ProdutoServico {
  int id;
  String nome;
  String valor;

  ProdutoServico({this.id, this.nome, this.valor});

  ProdutoServico.fromJson(Map<String, dynamic> xjson) {
    id = xjson['_id'];
    nome = xjson['nome'];
    valor = xjson['valor'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'nome': nome,
        'valor': valor,
      };
  ProdutoServico.toMap(Map<String, dynamic> map) {
    map['_id'] = id;
    map['nome'] = nome;
    map['valor'] = valor;
  }
  static Future<List<ProdutoServico>> getData({dynamic selector}) async {
    //{'_id': data.id} selector
    try {
      List<ProdutoServico> data = <ProdutoServico>[];
      var collection = bacon.bk.collection('ProdutoServico');
      await collection.find(selector).forEach((element) {
        data.add(ProdutoServico.fromJson(element));
      });
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}