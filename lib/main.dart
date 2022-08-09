import 'package:flutter/material.dart';

import 'features/Home/view/home_page.dart';
import 'features/Login/view/login_page.dart';
import 'features/Notification/view/notification_page.dart';
import 'features/Resetpassword/view/confirm_password.dart';
import 'features/Resetpassword/view/reset_password_page.dart';
import 'features/Signup/view/signup_page.dart';
import 'features/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Merriweather',
      ),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/mainScreen': (context) => MainScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/resetPassword': (context) => ResetPasswordPage(),
        '/confirmPassword': (context) => ConfirmPasswordPage(),
        '/notification': (context) => NotificationPage(),

      },
    );
  }
}


