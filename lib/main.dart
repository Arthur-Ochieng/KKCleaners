import 'package:cleaner/screens/fragments/address.dart';
import 'package:cleaner/screens/fragments/bookings.dart';
import 'package:cleaner/screens/fragments/marker.dart';
import 'package:cleaner/screens/home_page.dart';
import 'package:cleaner/screens/registration.dart';
import 'package:cleaner/screens/splash.dart';
import 'package:cleaner/screens/verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cleaner/screens/login_page.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home:  const LoginPage(),
    );
  }
}



/*
 CollectionReference bookings = FirebaseFirestore.instance.collection('booking');
 Future<void> addBooking(var bookings) {
      // Call the user's CollectionReference to add a new user
      return users
          .add(bookings)
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }






*/