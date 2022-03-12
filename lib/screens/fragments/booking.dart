import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> bottomMenus = [
    "Mini",
    "Sedan",
    "Prime",
    "Truck",
  ];

  List<IconData> bottomMenusIcons = [
    Icons.car_rental,
    Icons.local_taxi,
    Icons.car_repair,
    Icons.local_shipping,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Center(
            child: Text("Google Map"),
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
                        hintText: "Enter your pickup location",
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.black87,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.near_me,
                        color: Colors.black87,
                      ),
                      hintText: "Enter drop-off location",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Card(
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
                      onTap: (){
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 50,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: selectedIndex == index ? const Color(0xff3C2593): Colors.white,
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
                                color: selectedIndex == index ? Colors.white : const Color(0xff3C2593),
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
          ),
        ],
      ),
    );
  }
}
