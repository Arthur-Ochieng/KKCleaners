import 'package:cleaner/screens/fragments/address.dart';
import 'package:cleaner/screens/fragments/booking.dart';
import 'package:cleaner/screens/fragments/history.dart';
import 'package:cleaner/screens/fragments/marker.dart';
import 'package:cleaner/screens/fragments/profile.dart';
import 'package:cleaner/screens/fragments/wallet.dart';
import 'package:cleaner/widgets/drawer.dart';
import 'package:flutter/material.dart';
//import 'package:overlay_container/overlay_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page selected
  int indexPage = 0;
  final List fragments = const [
    AddressPage(),
    HistoryPage(),
    Profile(),
    BookingPage(),
    MarkerPage(),
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
//       body: Stack(
//         children: [
//           fragments[indexPage],
//           OverlayContainer(
//             show: _dropdownShown,
//             child: Container(
//               height: MediaQuery.of(context).size.height - 100,
//               width: MediaQuery.of(context).size.width -32,
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     blurRadius: 3,
//                     spreadRadius: 6,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Notification",
//                     style: TextStyle(fontSize: 30),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ]
//       )
     
//     );
//   }
// }
