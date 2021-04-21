class Cliente {
  int id;
  int idUser;
  String nome;
  String numero;
  String cpf;
  String email;

  Cliente({this.id, this.idUser, this.numero, this.nome, this.email, this.cpf});

  Cliente.fromJson(Map<String, dynamic> xjson) {
    id = xjson['_id'];
    idUser = xjson['idUser'];
    nome = xjson['nome'];
    numero = xjson['numero'];
    email = xjson['email'];
    cpf = xjson['cpf'];
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'idUser': idUser,
        'nome': nome,
        'numero': numero,
        'email': email,
        'cpf': cpf,
      };
  Cliente.toMap(Map<String, dynamic> map) {
    map['_id'] = id;
    map['idUser'] = idUser;
    map['nome'] = nome;
    map['numero'] = numero;
    map['email'] = email;
    map['cpf'] = cpf;
  }
}
