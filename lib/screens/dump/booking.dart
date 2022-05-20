import 'dart:async';
import 'package:cleaner/screens/requests/offers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition center = const CameraPosition(
    target: LatLng(-1.286389, 36.817223),
    zoom: 14.4746,
  );

  // static final CameraPosition _kLake = const CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414
  //     );

  List<String> bottomMenus = [
    "Laundry",
    "Carpet",
    "Dusting",
    "All",
  ];

  List<IconData> bottomMenusIcons = [
    Icons.dry_cleaning,
    Icons.house,
    Icons.wash,
    Icons.cleaning_services,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: center,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.my_location,
                          color: Colors.black87,
                        ),
                        hintText: "Pick Location of Service",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(bottomMenus.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 50,
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? const Color(0xff3C2593)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              children: [
                                selectedIndex == index
                                    ? Icon(
                                        bottomMenusIcons[index],
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : Container(),
                                SizedBox(
                                  width: selectedIndex == index ? 5 : 0,
                                ),
                                Text(
                                  bottomMenus[index],
                                  style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : const Color(0xff3C2593),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ConfirmTruce()
                        )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff3C2593),
                    ),
                    child: const Center(
                      child: Text("Confirm Location"),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
