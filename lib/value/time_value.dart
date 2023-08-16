
import 'package:intl/intl.dart';

class TimeValue{
  static String time = DateFormat('HH:mm:ss').format(DateTime.now());
  static String timeAlarm = DateFormat('HH:mm:ss').format(DateTime.now().add(Duration(minutes: 15)));
  String getTime(){
    return time;
  }
  String getTimeAlarm(){
    return timeAlarm;
  }
}