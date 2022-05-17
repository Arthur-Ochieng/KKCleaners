import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingSummary extends StatefulWidget {
  const BookingSummary({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  // String? userID = "";
  // late String? test;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  // @override
  // void initState() {
  //   super.initState();
  //   userID = currentUser?.uid;
  //   test = currentUser?.uid;
  // }

  @override
  Widget build(BuildContext context) {
    final _bookingStream = FirebaseFirestore.instance
        .collection('booking')
        // .where('uid', isEqualTo: userID)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _bookingStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> bookingData =
                document.data()! as Map<String, dynamic>;

            return ListTile(
              title: Text(
                  bookingData['service']! + ' ' + bookingData['cleaner']),
              subtitle: Text(bookingData['date']!),
            );
          }).toList(),
        );
      });
  }
}

