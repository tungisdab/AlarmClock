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

class _AlarmState extends State<Alarm> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  bool check = true;
  String textSearch = "Steal someone's heart";
  String timeCurrent = DateFormat('HH:mm:ss').format(DateTime.now());
  int currentPageIndex = 0;

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
    super.build(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        height: 60 ,
        indicatorColor: Colors.red.shade200,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.add_alert_rounded),
            icon: Icon(Icons.add_alert_outlined),
            label: 'Alarm',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.access_alarm),
            icon: Icon(Icons.add_alarm_rounded),
            label: 'Clock',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.access_time_filled),
            icon: Icon(Icons.access_time_outlined),
            label: 'Timer',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.hourglass_full),
            icon: Icon(Icons.hourglass_empty),
            label: 'Stopwatch',
          ),
        ],
      ),
      body: <Widget>[
        alarm(),
        clock(),
        timer(),
        stopwatch()
      ][currentPageIndex],
    );
  }

  Widget alarm(){
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    LocalNotification.showBigTextNotification(
                      title: "Khánh hiện lên và nói",
                      body: "Dậy thôi con trai",
                      fln: flutterLocalNotificationsPlugin,
                    );
                  },
                  child: Text(
                    "Get up",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.width/2,
                    child: Image.asset('assets/icon/icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.width/2,
                  child: Image.asset('assets/icon/icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
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
            ],
          ),
          Container(
            margin: EdgeInsets.all(35),
            child: Image.asset(
              'assets/icon/icon.png',
              fit: BoxFit.cover,
            )
          ),
          Container(
            margin: EdgeInsets.all(35),
            child: Image.asset(
              'assets/icon/icon.png',
              fit: BoxFit.cover,
            )
          ),
        ],
      ),
    );
  }

  Widget clock(){
    return SafeArea(
      child: Icon(
        Icons.watch_later_outlined,
        size: 100,
      ),
    );
  }

  Widget timer(){
    return SafeArea(
      child: Icon(
        Icons.hourglass_empty_outlined,
        size: 100,
      ),
    );
  }

  Widget stopwatch(){
    return SafeArea(
      child: Icon(
        Icons.add_alarm,
        size: 100,
      ),
    );
  }
}