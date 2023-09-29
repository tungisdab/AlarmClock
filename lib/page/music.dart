import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signUp() async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(
        email: '13342424@gmail.com',
        password: 'password123',
      );
    } catch(e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ElevatedButton(
          child: Text('dk'),
          onPressed: () {
            signUp();
          },
        ),
      ),
    );
  }
}