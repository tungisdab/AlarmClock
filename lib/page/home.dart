import 'package:alarm_clock/page/time_schedule.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/value/time_value.dart';
import 'package:alarm_clock/page/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tz;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    LocalNotification.initilize(flutterLocalNotificationsPlugin);
    tz.initializeTimeZones();
  }
  bool check = true;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm Clock'),
        
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                'Thời gian: ${TimeValue.time}',
                textAlign: TextAlign.center,
              ),
              Switch(
                thumbIcon: thumbIcon,
                value: check,
                onChanged: (bool value) {
                  setState(() {
                    check = value;
                    TimeValue.time = DateFormat('HH:mm:ss').format(DateTime.now());
                    TimeValue.timeAlarm = DateFormat('HH:mm:ss').format(DateTime.now().add(Duration(minutes: 15)));
                  });
                }
              ),
              ElevatedButton(
                onPressed: (){
                  LocalNotification.showBigTextNotification(
                    title: "Alarm Clock",
                    body: "Báo thức đã được đặt lúc ${TimeValue.timeAlarm}",
                    fln: flutterLocalNotificationsPlugin,
                  );
                },
                child: Text(
                  "Khánh hiện lên và nói",
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
                  "10 phút",
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
                  "15 phút",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                'Thời gian đặt báo thức: ${TimeValue.time}',
                textAlign: TextAlign.center,
              ),
            ],
          )
        )
      ),
    );
  }
}