import 'package:cleaner/screens/requests/details2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeclinedPage extends StatefulWidget {
  const DeclinedPage({Key? key}) : super(key: key);

  @override
  State<DeclinedPage> createState() => _DeclinedPageState();
}

class _DeclinedPageState extends State<DeclinedPage> {
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

  Widget realTimeDecline(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
    .collection('booking')
    .where('cleaner_uid', isEqualTo: currentUser?.uid)
    .where('status', isEqualTo: "declined")
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

              var bookingId = document.id;

              return Card(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("You declined this " +
                                bookingData['service']! +
                                " service request"),
                            const SizedBox(height: 20),
                            //Text(bookingData['cleaner']!),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(bookingData['time'].toString()),
                          const SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DefaultPage(
                                              bookingData: bookingData,
                                            )));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff172B4D),
                              ),
                              child: Container(
                                width: 60,
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: Text("Details"),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: realTimeDecline(context),
    );
  }
}
