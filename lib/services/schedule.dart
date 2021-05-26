import 'dart:async';
import 'dart:convert';
import 'package:background_fetch/background_fetch.dart';
import 'package:housebarber/model/notificacao.dart';
import 'package:housebarber/services/notificaion.dart';
import 'package:housebarber/services/senhas.dart';
import 'package:web_socket_channel/io.dart';

class Schedule {
  static Future<void> initPlatformState() async {
    try {
      await BackgroundFetch.configure(
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
      await BackgroundFetch.start().then((int status) {}).catchError((e) {});
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 600000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true));
    } catch (e) {}
    return;
  }

  static Future<void> _onBackgroundFetch(String taskId) async {
    if (taskId == 'com.transistorsoft.customtask') {
      await procuraAgendamento();
    }
    if (taskId == "flutter_background_fetch") {
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 600000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true));
    }
    BackgroundFetch.finish(taskId);
  }

  static void _onBackgroundFetchTimeout(String taskId) {
    BackgroundFetch.finish(taskId);
  }

  static void backgroundFetchHeadlessTask(HeadlessTask task) async {
    String taskId = task.taskId;
    bool timeout = task.timeout;
    if (taskId == 'com.transistorsoft.customtask') {
      await procuraAgendamento();
    }
    if (timeout) {
      BackgroundFetch.finish(taskId);
      return;
    }
    if (taskId == 'flutter_background_fetch') {
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "com.transistorsoft.customtask",
          delay: 600000, //600000,
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
    String token = '';
    if (token.isNotEmpty) {
      try {
        print('[schedule] iniciou o serviço');
        IOWebSocketChannel channel = IOWebSocketChannel.connect(
          Uri.parse(
            'ws://$hostGotify/stream?token=$token',
          ),
        );
        await Notifications.init();
        channel.stream.listen((message) {
          print('[schedule] $message');
          Notificacao note = Notificacao.fromJson(jsonDecode(message));
          Notifications.showNotification(
            id: note.id,
            titulo: note.title,
            conteudo: note.message,
          );
        });
        print('[schedule] finalizou o serviço');
      } catch (e) {
        await procuraAgendamento();
      }
    }
  }
}
