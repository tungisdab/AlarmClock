import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotification{
  static Future initilize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async{
    var initializationSettingsAndroid =
      AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsDarwin =
        DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings
    );
  }

  static Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async{

  AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'channel_id', 
      'channel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentSound: false,
    );
    var noti = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    await fln.show(
      0, 
      title,
      body,
      noti,
    );
  }
}