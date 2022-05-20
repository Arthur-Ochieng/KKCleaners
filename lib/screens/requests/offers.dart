import 'package:cleaner/screens/requests/details.dart';
import 'package:cleaner/screens/requests/details2.dart';
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
        .where('cleaner_uid', isEqualTo: currentUser?.uid)
        .where('status', isEqualTo: "pending")
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
                            Text("You have received a " +
                                bookingData['service']! +
                                " service request"),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent,
                                  ),
                                  onPressed: () {
                                    final docUser = FirebaseFirestore.instance
                                        .collection('booking')
                                        .doc(bookingId);

                                    //update
                                    docUser.update({
                                      'status': 'accepted',
                                    });
                                  },
                                  child: const Text("Accept"),
                                ),
                                const SizedBox(width: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent,
                                  ),
                                  onPressed: () {
                                    final docUser = FirebaseFirestore.instance
                                        .collection('booking')
                                        .doc(bookingId);

                                    //update
                                    docUser.update({
                                      'status': 'declined',
                                    });
                                  },
                                  child: const Text("Decline"),
                                ),
                              ],
                            ),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Offers"),
      ),
      body: realTimeBooks(context),
    );
  }
}
