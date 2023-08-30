
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotification{
  static Future initilize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async{
    var initializationSettingsAndroid =
      AndroidInitializationSettings('logokhanh');
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

  AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel_id', 
      'channel_name',
      icon: 'logokhanh',
      sound: RawResourceAndroidNotificationSound('alarmz'),
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