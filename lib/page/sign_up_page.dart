import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    List images = [
      "assets/images/fb1.png",
      "assets/images/gg1.png",
      "assets/images/tw1.png",

    ];
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
                    'Hello', 
                    style: TextStyle(
                      fontSize: 60, 
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    'Sign up',  
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.grey
                    )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          spreadRadius: 7,
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(1, 1),
                          spreadRadius: 7,
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.password_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),  
            SizedBox(
              height: 40,
            ),
            Container(
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
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.005,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: 'Have an account?',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.05,
            ),
            RichText(
              text: TextSpan(
                text: 'Sign up using one of the following methods',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                )
              ),
            ),
            Wrap(
              children: List<Widget>.generate(
                3,
                (index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          images[index]
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}