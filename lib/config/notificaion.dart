import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}

class Notifications {
  static init() async {
    var initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {
          didReceiveLocalNotificationSubject
              .add(ReceivedNotification(id: id, title: title, body: body, payload: payload));
        });
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
      selectNotificationSubject.add(payload);
    });
  }

  static showNotification({@required int id, @required String titulo, @required String conteudo}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(id, titulo, conteudo, platformChannelSpecifics,
        payload: 'item x');
  }

  static showLinesNotification(
      {@required int id,
      @required String titulo,
      @required String descricao,
      @required List<String> conteudo}) async {
    InboxStyleInformation inboxStyleInformation =
        InboxStyleInformation(conteudo, contentTitle: titulo, summaryText: 'Vendas Online');
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: inboxStyleInformation,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(id, titulo, descricao, platformChannelSpecifics,
        payload: 'item x');
  }

  static cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }
}
