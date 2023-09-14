import 'dart:async';
import 'package:alarm_clock/page/time_schedule.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/page/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  bool check = true;
  String textSearch = "Steal someone's heart";
  String timeCurrent = DateFormat('HH:mm:ss').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    LocalNotification.initilize(flutterLocalNotificationsPlugin);
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeCurrent = DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            children: [
              Text(
                'Bây giờ là:',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                // '${_time.hour}:${_time.minute}:${_time.second}',
                timeCurrent,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: (){
                  LocalNotification.showBigTextNotification(
                    title: "Khánh hiện lên và nói",
                    body: "Dậy thôi con trai",
                    fln: flutterLocalNotificationsPlugin,
                  );
                },
                child: Text(
                  "   Get up   ",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await TimeSchedule.showFullScreenNotification(
                    context: context,
                    fln: flutterLocalNotificationsPlugin,
                    timeAlarm: 10,
                  );
                },
                child: Text(
                  "1/6 hours",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await TimeSchedule.showFullScreenNotification(
                    context: context,
                    fln: flutterLocalNotificationsPlugin,
                    timeAlarm: 15,
                  );
                },
                child: Text(
                  "1/4 hours",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await TimeSchedule.showFullScreenNotification(
                    context: context,
                    fln: flutterLocalNotificationsPlugin,
                    timeAlarm: 20,
                  );
                },
                child: Text(
                  "1/3 hours",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await TimeSchedule.showFullScreenNotification(
                    context: context,
                    fln: flutterLocalNotificationsPlugin,
                    timeAlarm: 30,
                  );
                },
                child: Text(
                  "1/2 hours",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}