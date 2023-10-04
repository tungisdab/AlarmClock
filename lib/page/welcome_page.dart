import 'package:alarm_clock/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  String email;
  WelcomePage({super.key, required this.email});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    String email = widget.email;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthScreen, 
              height: heightScreen * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/a10.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: heightScreen * 0.15,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/a9.jpg'),
                  )
                ],
              ),
            ),
            Container(
              width: widthScreen,
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome', 
                    style: TextStyle(
                      fontSize: 60, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    email,  
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.grey
                    )
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),  
            GestureDetector(
              onTap: (){
                AuthController.instance.signOut();
              },
              child: Container(
                width: widthScreen * 0.5,
                height: heightScreen * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/a8.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.05,
            ),
            
          ],
        ),
      ),
    );
  }
}