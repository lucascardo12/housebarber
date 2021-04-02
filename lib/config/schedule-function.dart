// import 'dart:async';
// import 'package:background_fetch/background_fetch.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Schedule {
//   static void registerHeadless() {
//     BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
//   }

//   static void backgroundFetchHeadlessTask(String taskId) async {
//     print('[Schedule ' +
//         DateTime.now().toString() +
//         '] Evento recebido: $taskId');

//     await runScheduleFunction(taskId);

//     BackgroundFetch.finish(taskId);
//   }

//   static Future<void> runScheduleFunction(String taskId) async {
//     switch (taskId) {
//       case 'com.barber.sincronizaDadosCadastrais':
//         //await aqui é onde a função para gerar coisas;
//         break;
//       default:
//     }
//     return null;
//   }

//   static Future<void> init() async {
//     BackgroundFetch.configure(
//         BackgroundFetchConfig(
//             minimumFetchInterval: 15,
//             stopOnTerminate: false,
//             enableHeadless: true,
//             startOnBoot: true,
//             forceAlarmManager: true,
//             requiresBatteryNotLow: false,
//             requiresCharging: false,
//             requiresStorageNotLow: false,
//             requiresDeviceIdle: false,
//             requiredNetworkType: NetworkType.NONE), (String taskId) async {
//       print("[Schedule " +
//           DateTime.now().toString() +
//           "] Evento recebido: $taskId");
//       try {
//         await runScheduleFunction(taskId);
//       } catch (e) {
//         print(e);
//       }

//       // IMPORTANTE: Você deve sinalizar a conclusão de sua tarefa ou o sistema operacional pode punir seu aplicativo
//       // por demorar muito em segundo plano.

//       if (taskId == "flutter_background_fetch") {
//         BackgroundFetch.scheduleTask(TaskConfig(
//             taskId: "com.barber.sincronizaDadosCadastrais",
//             delay: 1800000,
//             periodic: true,
//             forceAlarmManager: true,
//             stopOnTerminate: false,
//             startOnBoot: true,
//             enableHeadless: true));
//       }
//       print("[Schedule " +
//           DateTime.now().toString() +
//           "] Evento $taskId finalizado");

//       //BackgroundFetch.finish(taskId);
//     }).then((int status) {
//       print('[Schedule] Configuracao relizada com sucesso: $status');
//     }).catchError((e) {
//       print('[Schedule] Erro na configuracao: $e');
//     });

//     await BackgroundFetch.start().then((int status) {
//       print('[Schedule] Iniciado com sucesso: $status');
//     }).catchError((e) {
//       print('[Schedule] Falha ao iniciar: $e');
//     });

//     BackgroundFetch.scheduleTask(TaskConfig(
//         taskId: "com.barber.sincronizaDadosCadastrais",
//         delay: 1000,
//         periodic: true,
//         forceAlarmManager: true,
//         stopOnTerminate: false,
//         enableHeadless: true,
//         startOnBoot: true));
//   }
// }
