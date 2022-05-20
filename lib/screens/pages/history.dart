import 'package:cleaner/screens/requests/details.dart';
import 'package:cleaner/screens/requests/details2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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

  Widget realTimeHistory(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
    .collection('booking')
    //.where('cleaner_uid', isEqualTo: currentUser?.uid)
    .where('status', isEqualTo: "completed")
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
                            Text(
                              "The Client's name is " + bookingData['cleaner']!,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  bookingData['service']! + " service",
                                ),
                                const SizedBox(width: 30),
                                Text(
                                  bookingData['date'].toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //Text(bookingData['time'].toString()),
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
                            )
                          ),
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
      appBar: AppBar(
        title: Text("History"),
      ),
      body: realTimeHistory(context),
    );
  }
}
