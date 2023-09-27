import 'package:alarm_clock/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, 
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      home: DefaultTabController(
        length: 6,
        child: Home(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'My heartbeats',
      debugShowCheckedModeBanner: false,
    );
  }
}