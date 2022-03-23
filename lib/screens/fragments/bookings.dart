import 'package:cleaner/screens/login_page.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference bookings =
      FirebaseFirestore.instance.collection('booking');
  Future<void> addBooking(var booking) {
    // Call the user's CollectionReference to add a new user
    return bookings
        .add(booking)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child: Text("Add Booking"),
              onTap: () {
                if (user != null) {
                  var new_booking = {
                    "address": "Nairobi",
                    "cleaner_name": "John Doe",
                    "client_name": user?.displayName,
                    "cleaner_uid": "dsjcnjdsnUIGY",
                    "client_uid": user?.uid,
                    "service": "House Cleaning",
                    "address_lat": 1.233,
                    "address_lng": -31.43443,
                    "date": new DateTime.now(),
                  };
                  
                  addBooking(new_booking);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                }
              },
            ),
            GestureDetector(
              child: Text("Get User ID"),
              onTap: () {
                if (user != null) {
                  print(user);
                } else {
                  print("Not signed in");
                }
              },
            ),
            GestureDetector(
              child: Text("Update User Profile"),
              onTap: () {
                if (user != null) {
                  //Update Display Name
                  user?.updateDisplayName("Arthur Ochieng");
                  // user?.updatePhotoURL("link to image");
                  // user?.updateEmail("new_email@example.com")
                  
                  print(user);
                } else {
                  print("Not signed in");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
