import 'package:cleaner/screens/fragments/profile.dart';
import 'package:cleaner/screens/login_page.dart';
import 'package:cleaner/screens/splash.dart';
import 'package:cleaner/screens/verification.dart';
import 'package:cleaner/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:cleaner/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

