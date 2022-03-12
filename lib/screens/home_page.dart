import 'package:cleaner/screens/fragments/address.dart';
import 'package:cleaner/screens/fragments/booking.dart';
import 'package:cleaner/screens/fragments/history.dart';
import 'package:cleaner/screens/fragments/profile.dart';
import 'package:cleaner/screens/fragments/wallet.dart';
import 'package:cleaner/widgets/drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page selected
  int indexPage = 0;
  final List fragments = const [
    BookingPage(),
    HistoryPage(),
    Profile(),
    AddressPage(),
    WalletPage(),
  ];
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
          onPressed: (){
            _scaffoldKey.currentState!.openDrawer();
          }, 
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      drawer: MyDrawer(
        indexPage: indexPage,
        onMenuTap: (page){
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