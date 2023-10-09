import 'package:alarm_clock/page/home.dart';
import 'package:alarm_clock/page/home1.dart';
import 'package:alarm_clock/page/sign_in_page.dart';
import 'package:alarm_clock/page/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth  auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null ){
      print("login page");
      Get.offAll(() => SignInPage());
    }
    else{
      Get.offAll(() => WelcomePage(email: user.email!));
    }
  }

  void register(String email, password) async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      Get.snackbar("About User", "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
    }
  }

  void signIn(String email, password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      Get.snackbar("About SignIn", "SignIn message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "SignIn failed",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
    }
  }

  void signOut() async{
    try{
      await auth.signOut();
    }catch(e){
      debugPrint(e.toString());
    }
  }

} 