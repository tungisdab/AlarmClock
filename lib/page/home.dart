import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String time = DateFormat('HH:mm:ss').format(currentTime);
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            time, 
            textAlign: TextAlign.center,
          )
        )
      ),
    );
  }
}