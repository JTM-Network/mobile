import 'package:flutter/material.dart';
import 'package:jtm/presenter/pages/auth/forgot_password_page.dart';
import 'package:jtm/presenter/pages/auth/sign_in_page.dart';
import 'package:jtm/presenter/pages/auth/sign_up_page.dart';
import 'package:jtm/presenter/pages/home_page.dart';
import 'package:jtm/presenter/pages/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RootPage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/forgotpassword': (context) => ForgotPasswordPage(),
        '/home': (context) => HomePage()
      },
    );
  }
}

