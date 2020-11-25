import 'package:housebarber/config/global.dart';
import 'package:housebarber/model/empresa.dart';
import 'package:housebarber/model/user.dart';

class Customfunctions {
  static validaCadastro({var infoArray}) {
    print(infoArray);
    var nome = infoArray["nome"];
    var usuario = infoArray["usuario"];
    var senha = infoArray["senha"];
    var numero = infoArray["numero"];
    var cnpj = infoArray["cpfcnpj"];
    var email = infoArray["email"];
    var mensagem = "";
    if (nome == "") {
      mensagem += "Nome é Obrigatório";
    }
    if (numero == "") {
      mensagem += "numero é Obrigatório";
    }
    if (cnpj == "") {
      mensagem += "cnpj é Obrigatório";
    }
    if (email == "") {
      mensagem += "email é Obrigatório";
    }
    if (usuario == "") {
      mensagem += "usuario é Obrigatório";
    }
    if (senha == "") {
      mensagem += "senha é Obrigatório";
    }
    if (mensagem == "") {
      cadastraEmpresa(infoArray: infoArray);
    } else {
      //Retorn mensagem para tela de usuario.
    }
  }

  static cadastraEmpresa({var infoArray}) {
    User user = bacon.getUser(
        login: infoArray['usuario'],
        senha: infoArray['senha'],
        tipoUser: infoArray['tipoUser']);
    if (user != null) {
      Empresa empresa = new Empresa(
          nome: infoArray['nome'],
          numero: infoArray['numero'],
          idUser: user.idUser,
          cnpj: infoArray['cpfcnpj'],
          email: infoArray['email']);

      bacon.alteraEmpresa(empresa: empresa);
    }
  }
}
