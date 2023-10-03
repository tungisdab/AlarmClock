import 'package:alarm_clock/page/home.dart';
import 'package:alarm_clock/page/sign_in_page.dart';
import 'package:alarm_clock/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    // return MaterialApp(
      
    //   home: DefaultTabController(
    //     length: 6,
    //     child: Home(),
    //   ),
    //   theme: ThemeData(
    //     primarySwatch: Colors.red,
    //   ),
    //   title: 'My heartbeats',
    //   debugShowCheckedModeBanner: false,
    // );
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      title: 'My heartbeats',
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}