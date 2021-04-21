import 'package:get/get.dart';
import 'package:housebarber/model/cliente.dart';
import 'package:housebarber/model/produtoServico.dart';
import 'package:housebarber/services/global.dart';

class HomeController extends GetxController {
  final MongoDB db = Get.find<MongoDB>();
  final gb = Get.find<Global>();
  var pag = 0.obs;

  @override
  Future<void> onInit() async {
    await carregaListas();
    super.onInit();
  }

  Future<void> carregaListas() async {
    await db.getData(selector: {'idUser': gb.user.id}, tabela: "ProdutoServico").then((value) {
      value.forEach((element) {
        gb.listadeProdutoServico.add(
          ProdutoServico.fromJson(element),
        );
      });
    });
    await db.getData(selector: {'idUser': gb.user.id}, tabela: "Cliente").then((value) {
      value.forEach((element) {
        gb.listadeCliente.add(
          Cliente.fromJson(element),
        );
      });
    });
  }
}
