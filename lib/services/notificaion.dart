import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notification extends GetxService {
  Future<Notification> inicia() async {
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        'resource://drawable/launcher_icon',
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Colors.white,
              ledColor: Colors.white)
        ]);

    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      if (!isAllowed) {
        // Insert here your friendly dialog box before call the request method
        // This is very important to not harm the user experience
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    return this;
  }

  Future<void> showFullScreenNotification({int id, String title, String body}) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
      ),
    );
  }

  void notificacaoDeToque() {
    AwesomeNotifications().actionStream.listen((receivedNotification) {
      Get.toNamed('/NotificationPage', arguments: {
        "receive": receivedNotification
      } // your page params. I recommend to you to pass all *receivedNotification* object
          );
    });
  }
}
