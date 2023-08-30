import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class TimeSchedule{
  static Future<void> showFullScreenNotification({
      required BuildContext context, 
      required FlutterLocalNotificationsPlugin fln, 
      required int timeAlarm,
    }) async {
    await showDialog(
      context: context,  
      builder: (_) => AlertDialog(
        title: const Text('Ngủ đi con zai'),
        content: const Text(
            'Ấn OK đi con zai'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await fln.zonedSchedule(
                  0,
                  'Khánh hiện lên và nói',
                  'Dậy thôi con trai',
                  tz.TZDateTime.now(tz.local).add(Duration(minutes: timeAlarm)),
                  const NotificationDetails(
                      android: AndroidNotificationDetails(
                          'full screen channel id', 'full screen channel name',
                          channelDescription: 'full screen channel description',
                          priority: Priority.high,
                          importance: Importance.high,
                          sound: RawResourceAndroidNotificationSound('alarmz'),
                          playSound: true,
                          fullScreenIntent: true)),
                  androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
                  uiLocalNotificationDateInterpretation:
                      UILocalNotificationDateInterpretation.absoluteTime);

              Navigator.pop(context);
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}