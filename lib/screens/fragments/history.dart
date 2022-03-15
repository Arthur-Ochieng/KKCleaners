import 'package:cleaner/models/history.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<HistoryModel> historyDummy = [
    HistoryModel(
        cleanerId: "567",
        source: "Carpet-Cleaning",
        destination: "Embakasi",
        time: "Today 1630hrs"),
    HistoryModel(
        cleanerId: "145",
        source: "Laundry-Cleaning",
        destination: "Langata",
        time: "Tomorrow 1145hrs"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    // Column(
                    //   children: [
                    //     Icon(Icons.cleaning_services),
                    //     SizedBox(
                    //       height: 5,
                    //     ),
                    //     // Image.asset(
                    //     //   "assets/images/KK.png",
                    //     //   fit: BoxFit.cover,
                    //     //   height: 60,
                    //     // ),
                    //     Icon(Icons.near_me),
                    //   ],
                    // ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(historyDummy[index].source),
                          SizedBox(height: 60),
                          Text(historyDummy[index].destination),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(historyDummy[index].time),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            print(historyDummy[index].cleanerId);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff172B4D),
                          ),
                          child: Container(
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text("View"),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: historyDummy.length,
      ),
    );
  }
}
