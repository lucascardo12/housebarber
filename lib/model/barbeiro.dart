class Barbeiro {
  String idEmpresa;
  String idUser;
  String nome;
  String numero;
  String cnpj;
  String email;
  String fornecedor;

  Barbeiro(
      {String idEmpresa,
      String idUser,
      String numero,
      String nome,
      String email,
      String cnpj,
      String fornecedor,
      List<int> listClient,
      List<int> listFunc}) {
    this.idEmpresa = idEmpresa;
    this.idUser = idUser;
    this.numero = numero;
    this.nome = nome;
    this.email = email;
  }
  Barbeiro.fromJson(Map<String, dynamic> xjson) {
    idEmpresa = xjson['_id'];
    idUser = xjson['idUser'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
  }

  Map<String, dynamic> toJson() => {
        '_id': idEmpresa,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
      };
  Barbeiro.toMap(Map<String, dynamic> map) {
    map['_id'] = idEmpresa;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
  }
}
