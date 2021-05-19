import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:housebarber/pages/cadastros/lista-servico-page.dart';
import 'package:housebarber/pages/home/home-page.dart';
import 'package:housebarber/pages/home/new-registers-page.dart';
import 'package:housebarber/pages/cadastros/lista-clientes-page.dart';
import 'package:housebarber/pages/cadastros/register-new-client-page.dart';
import 'package:housebarber/pages/cadastros/register-new-productService-page.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/services/schedule.dart';
import 'pages/login/login-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => Global().inicia());
  if (GetPlatform.isMobile) await Schedule.initPlatformState();
  if (GetPlatform.isMobile) await Get.putAsync(() => MongoDB().inicia());
  runApp(MyApp());
  if (GetPlatform.isMobile)
    BackgroundFetch.registerHeadlessTask(
      Schedule.backgroundFetchHeadlessTask,
    );
}

class MyApp extends GetView {
  final gb = Get.find<Global>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barbudos Agendamento',
      theme: ThemeData(
        backgroundColor: gb.primaryLight,
        brightness: Brightness.light,
        primaryColor: gb.primary,
        primaryColorDark: gb.primaryDark,
        primaryColorLight: gb.primaryLight,
        accentColor: gb.secondary,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: gb.primary,
              secondary: gb.secondary,
            ),
      ),
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
      defaultTransition: Transition.leftToRightWithFade,
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
          page: () => NewRegistersPage(),
        ),
        GetPage(
          name: '/newClient',
          page: () => RegisterNewClientPage(),
        ),
        GetPage(
          name: '/newProductService',
          page: () => RegisterNewProductServicePage(),
        ),
        GetPage(
          name: '/listaProdutoServico',
          page: () => ListaProdutoServicoPage(),
        ),
        GetPage(
          name: '/listaClientes',
          page: () => ListaClientes(),
        ),
      ],
    );
  }
}
