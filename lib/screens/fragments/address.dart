import 'package:cleaner/screens/fragments/details.dart';
import 'package:flutter/material.dart';
const cleanerData = [
  {
    'cleanerName': 'Cameron Jones',
    'company': 'Super Clean Washers',
    'rating': '4.8',
    'rateAmount': '56',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffFFF0EB),
  },
  {
    'cleanerName': 'Max Robertson',
    'company': 'Rossano Farretin Washers',
    'rating': '4.7',
    'rateAmount': '85',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffEBF6FF),
  },
  {
    'cleanerName': 'Beth Watson',
    'company': 'Neville Clean Washers',
    'rating': '4.9',
    'rateAmount': '73',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffFFF0EB),
  },
    {
    'cleanerName': 'Beth Watson',
    'company': 'Neville Clean Washers',
    'rating': '4.9',
    'rateAmount': '73',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffFFF0EB),
  },
    {
    'cleanerName': 'Beth Watson',
    'company': 'Neville Clean Washers',
    'rating': '4.9',
    'rateAmount': '73',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffFFF0EB),
  },
    {
    'cleanerName': 'Beth Watson',
    'company': 'Neville Clean Washers',
    'rating': '4.9',
    'rateAmount': '73',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffFFF0EB),
  },
    {
    'cleanerName': 'Beth Watson',
    'company': 'Neville Clean Washers',
    'rating': '4.9',
    'rateAmount': '73',
    'imgUrl': 'assets/images/KK.png',
    'bgColor': Color(0xffFFF0EB),
  },
];

class AddressPage extends StatefulWidget {
  const AddressPage({ Key? key }) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const Padding(
                padding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.arrow_back_ios,
                //         color: Colors.white,
                //       ),
                //     ),
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.search,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Job Offers",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        CleanerCard(cleanerData[0]),
                        CleanerCard(cleanerData[1]),
                        CleanerCard(cleanerData[2]),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CleanerCard extends StatelessWidget {
  final cleaner;
  CleanerCard(this.cleaner);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cleaner['bgColor'],
      ),
      child: Stack(children: <Widget>[
        Positioned(
          top: 20,
          right: -60,
          child: Image.asset(
            cleaner['imgUrl'],
            width: MediaQuery.of(context).size.width * 0.60,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cleaner['cleanerName'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text(cleaner['company'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  )),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xff4E295B),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    cleaner['rating'],
                    style: const TextStyle(
                      color: Color(0xff4E295B),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(cleaner)));
                },
                color: const Color(0xff4E295B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'View Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
