import 'package:alarm_clock/controller/auth_controller.dart';
import 'package:alarm_clock/page/home.dart';
import 'package:alarm_clock/page/home1.dart';
import 'package:alarm_clock/page/sign_in_page.dart';
import 'package:alarm_clock/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyCI6Mb-v8EQf1RoEqe3LN-itI_mxm3rqDo", appId: "1:436811213920:android:7d31280f664e4176f8a705", messagingSenderId: "436811213920", projectId: "myself-6849d"),).then((value) => Get.put(AuthController()));
  // await Firebase.initializeApp().then((e) => Get.put(AuthController()));
  // try{
  //   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((e) => Get.put(AuthController()));

  // } catch(e) {
  //   print("khanh " + e.toString());
  // }
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, 
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]
  );
  runApp(MyApp());
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

    // return Home1();

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