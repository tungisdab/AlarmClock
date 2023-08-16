import 'package:flutter/material.dart';
import 'package:alarm_clock/value/time_value.dart';
import 'package:alarm_clock/page/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

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
                    title: "khanh11111", 
                    body: "hehe1111",
                    flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin 
                  );
                },
            child: Text(
              "tung",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),

              Text(
                'Thời gian báo thức: ${TimeValue.timeAlarm}',
                textAlign: TextAlign.center,
              ),
            ],
          )
        )
      ),
      // body: Center(
      //   child: Container(
      //     width: 180,
      //     height: 50,
      //     child: ElevatedButton(
      //       onPressed: (){
      //         LocalNotification.showBigTextNotification(
      //           title: "khanh11111", 
      //           body: "hehe1111",
      //           flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin 
      //         );
      //       },
      //       child: Text(
      //         "tung",
      //         style: const TextStyle(
      //           fontSize: 18,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}