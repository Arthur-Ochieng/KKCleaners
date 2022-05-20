import 'package:cleaner/screens/dump/booking.dart';
import 'package:cleaner/screens/pages/accepted.dart';
import 'package:cleaner/screens/pages/declined.dart';
import 'package:cleaner/screens/pages/history.dart';
import 'package:cleaner/screens/requests/marker.dart';
import 'package:cleaner/screens/requests/offers.dart';
import 'package:cleaner/screens/profile/profile.dart';
import 'package:cleaner/widgets/drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page selected
  int indexPage = 0;
  final List fragments = const [
    ConfirmTruce(),
    HistoryPage(),
    AcceptedPage(),
    DeclinedPage(),
    Profile(),
  ];

  bool _dropdownShown = false;
  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _toggleDropdown, 
            icon: const Icon(
              Icons.notifications,
            ),
          )
        ],
      ),
      drawer: MyDrawer(
        indexPage: indexPage,
        onMenuTap: (page) {
          Navigator.pop(context);
          setState(() {
            indexPage = page;
          });
        },
      ),
      body: fragments[indexPage],
    );
  }
}

