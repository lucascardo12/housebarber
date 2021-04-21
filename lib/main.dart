import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:housebarber/config/custom-colors.dart';
import 'package:housebarber/pages/cadastros/lista-servico-page.dart';
import 'package:housebarber/pages/home/home-page.dart';
import 'package:housebarber/pages/home/new-registers-page.dart';
import 'package:housebarber/pages/cadastros/lista-clientes-page.dart';
import 'package:housebarber/pages/cadastros/register-new-client-page.dart';
import 'package:housebarber/pages/cadastros/register-new-productService-page.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:housebarber/config/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login/login-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    prefs = await SharedPreferences.getInstance();
    bacon.bk = await Db.create("$format://$login:$senha@$host/$cluster?retryWrites=true&w=majority");
    await bacon.bk.open();
  } catch (e) {}
  // Notifications.init();
  // Schedule.init();
  runApp(MyApp());
}

class MyApp extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Barber',
      theme: ThemeData(
          backgroundColor: primaryLight,
          brightness: Brightness.light,
          primaryColor: primary,
          primaryColorDark: primaryDark,
          primaryColorLight: primaryLight,
          accentColor: secondary,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primary,
                secondary: secondary,
              )),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      locale: Get.deviceLocale,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/newRegisters',
          page: () => NewRegisters(),
        ),
        GetPage(
          name: '/newClient',
          page: () => RegisterNewClient(),
        ),
        GetPage(
          name: '/newProductService',
          page: () => RegisterNewProductService(),
        ),
        GetPage(
          name: '/listaClientes',
          page: () => ListaProdutoServico(),
        ),
        GetPage(
          name: '/listaProdutoServico',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/listaClientes',
          page: () => ListaClientes(),
        ),
      ],
    );
  }
}
