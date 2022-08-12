import 'package:finesse/views/screens/Home/view/home_page.dart';
import 'package:finesse/views/screens/Notification/view/notification_page.dart';
import 'package:finesse/views/screens/auth/login/view/login_page.dart';
import 'package:finesse/views/screens/auth/resetpassword/view/confirm_password.dart';
import 'package:finesse/views/screens/auth/resetpassword/view/reset_password_page.dart';
import 'package:finesse/views/screens/auth/signup/view/signup_page.dart';
import 'package:finesse/views/screens/category/men_categories.dart';
import 'package:finesse/views/screens/main_screen.dart';
import 'package:finesse/views/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// TODO :: Your dir structuing, for design code will be ->
/*
lib
  -src
    -features
    -widgets(components)

Example::
lib
  -src
    -features
      -auth
        -login
          -view
            login_screen.dart
          -components
            some_component.dart
    -widgets(components)
*/
// TODO :: Please code UI extra carefully pay attention to design, colors, borders, radius etc...

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      initialRoute: '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/mainScreen': (context) => const MainScreen(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/resetPassword': (context) => const ResetPasswordPage(),
        '/confirmPassword': (context) => const ConfirmPasswordPage(),
        '/notification': (context) => const NotificationPage(),
        '/menCategories': (context) => const MenSection(),
        '/productDetails': (context) => const ProductDetails(),
      },
    );
  }
}
