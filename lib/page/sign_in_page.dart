import 'package:alarm_clock/page/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('assets/images/a8.jpg'),
                  fit: BoxFit.cover,
                ),
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
                    'Sign into your account',  
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.grey
                    )
                  ),
                  SizedBox(
                    height: 50,
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
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
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
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.grey,
                        ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Forgot your password',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
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
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * 0.07,
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () => Get.to(()=> SignUpPage())
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}