class ProdutoServico {
  int id;
  String nome;
  double valor;
  int idUser;

  ProdutoServico({this.id, this.nome, this.valor, this.idUser});

  ProdutoServico.fromJson(Map<String, dynamic> xjson) {
    id = xjson['_id'];
    nome = xjson['nome'];
    valor = xjson['valor'];
    idUser = xjson['idUser'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'nome': nome,
        'valor': valor,
        'idUser': idUser,
      };
  ProdutoServico.toMap(Map<String, dynamic> map) {
    map['_id'] = id;
    map['nome'] = nome;
    map['valor'] = valor;
    map['idUser'] = idUser;
  }
}
