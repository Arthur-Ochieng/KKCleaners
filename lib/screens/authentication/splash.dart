import 'dart:async';

import 'package:cleaner/screens/authentication/login_page.dart';
import 'package:cleaner/screens/authentication/welcome_page.dart';
import 'package:cleaner/widgets/app_text_bold.dart';
import 'package:cleaner/widgets/constants.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //moving to the welcome page after a few seconds

  @override
  void initState(){
    Timer(const Duration(milliseconds: 2500),() {
      //push replacement used to delete the splash page from the stack
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WelcomePage()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: Image.asset(
                "assets/images/KK.png",
                height: 150,
                width: 150,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: AppTextBold(text: "KK Cleaners"),
            ),
          ],
        ),
      ),
    );
  }
}