import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConfirmTruce extends StatefulWidget {
  const ConfirmTruce({Key? key}) : super(key: key);

  @override
  State<ConfirmTruce> createState() => _ConfirmTruceState();
}

class _ConfirmTruceState extends State<ConfirmTruce> {
  String? userID = "";
  late String? test;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  void initState() {
    super.initState();
    userID = currentUser?.uid;
    test = currentUser?.uid;
  }

  Widget realTimeBooks(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
    .collection('booking')
    //.doc()
    .where('uid', isEqualTo: currentUser?.uid)
    .snapshots();

    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> bookingData =
                  document.data()! as Map<String, dynamic>;
    
              return ListTile(
                title: Text(bookingData['cleaner']!),
                subtitle: Text(bookingData['service']!),
                trailing: ElevatedButton(
                  onPressed: () {
                    //print(userID);
                  },
                  child: const Text("View Profile"),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Offers"),
      ),
      body: realTimeBooks(context),
    );
  }
}
