import 'dart:async';
import 'package:background_fetch/background_fetch.dart';
import 'package:get/get.dart';
import 'package:housebarber/model/agendamento.dart';
import 'package:housebarber/model/user.dart';
import 'package:housebarber/services/custom-functions.dart';
import 'package:housebarber/services/global.dart';
import 'package:housebarber/services/notificaion.dart';

class Schedule {
  static Future<void> initPlatformState() async {
    try {
      int status = await BackgroundFetch.configure(
          BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            startOnBoot: true,
            forceAlarmManager: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.ANY,
          ),
          _onBackgroundFetch,
          _onBackgroundFetchTimeout);
      print('[BackgroundFetch] configure success: $status');
      await BackgroundFetch.start().then((int status) {
        print('[Schedule] Iniciado com sucesso: $status');
      }).catchError((e) {
        print('[Schedule] Falha ao iniciar: $e');
      });
      // Schedule a "one-shot" custom-task in 10000ms.
      // // These are fairly reliable on Android (particularly with forceAlarmManager) but not iOS,
      // // where device must be powered (and delay will be throttled by the OS).
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 1000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true));
    } catch (e) {
      print('[BackgroundFetch] configure ERROR: $e');
    }
    return;
  }

  static Future<void> _onBackgroundFetch(String taskId) async {
    if (taskId == 'com.transistorsoft.customtask') {
      await procuraAgendamento();
    }
    if (taskId == "flutter_background_fetch") {
      // // Schedule a one-shot task when fetch event received (for testing).

      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 1000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true));
    }

    // IMPORTANT:  You must signal completion of your fetch task or the OS can punish your app
    // for taking too long in the background.
    BackgroundFetch.finish(taskId);
  }

  /// This event fires shortly before your task is about to timeout.  You must finish any outstanding work and call BackgroundFetch.finish(taskId).
  static void _onBackgroundFetchTimeout(String taskId) {
    print("[BackgroundFetch] TIMEOUT: $taskId");
    BackgroundFetch.finish(taskId);
  }

  static void backgroundFetchHeadlessTask(HeadlessTask task) async {
    String taskId = task.taskId;
    bool timeout = task.timeout;
    if (taskId == 'com.transistorsoft.customtask') {
      await procuraAgendamento();
    }
    if (timeout) {
      print("[BackgroundFetch] Headless task timed-out: $taskId");
      BackgroundFetch.finish(taskId);
      return;
    }
    if (taskId == 'flutter_background_fetch') {
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 1000, //600000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true));
    }
    BackgroundFetch.finish(taskId);
  }

  static Future<void> procuraAgendamento() async {
    await Notifications.init();
    Global gb;
    MongoDB db;
    print('[schedule] iniciou o serviço');
    try {
      db = Get.find<MongoDB>();
      gb = Get.find<Global>();
    } catch (e) {
      gb = await Get.putAsync(() => Global().inicia());
      db = await Get.putAsync(() => MongoDB().inicia());
    }

    User userlogin = User();
    List<Agendamento> listAgenda = [];
    userlogin.login = gb.prefs.getString('login') ?? '';
    userlogin.senha = gb.prefs.getString('senha') ?? '';
    await db.getData(
      selector: {
        "login": userlogin.login,
        "senha": Customfunctions.textToMd5(userlogin.senha),
      },
      tabela: "User",
    ).then((value) async {
      if (value != null) {
        userlogin = User.fromJson(value.first);
        await db.getData(
          selector: {
            'idUser': userlogin.id,
            'data': DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            )
          },
          tabela: 'Agendamento',
        ).then(
          (value) {
            value.forEach(
              (element) {
                listAgenda.add(Agendamento.fromJson(element));
              },
            );
          },
        );
      }
    });
    for (var i = 0; i < listAgenda.length; i++) {
      print('[schedule] ${listAgenda[i].id}');
      Notifications.showNotification(
        id: listAgenda[i].id,
        titulo: listAgenda[i].title,
        conteudo: listAgenda[i].idServico.toString(),
      );
    }
    print('[schedule] finalizou o serviço');
  }
}
