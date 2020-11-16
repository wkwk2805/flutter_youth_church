import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {

  Future<dynamic> getNotificationPlugin() async {
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    var _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
    return _flutterLocalNotificationsPlugin;
  }

  Future<void> showNotification() async {
    var android = AndroidNotificationDetails('your channel id', 'your channel name', 'your channel description',importance: Importance.max, priority: Priority.high);
    var ios = IOSNotificationDetails();
    var detail = NotificationDetails(android: android, iOS: ios);
    var plugin = await getNotificationPlugin();
    var payload = 'Hello Flutter';
    await plugin.show(0,'Title','Contents',detail, payload: payload);
  }

  Future<void> onSelectNotification(String payload) async {
    debugPrint("$payload");
  }
}
