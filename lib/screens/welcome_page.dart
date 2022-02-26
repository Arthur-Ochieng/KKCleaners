import 'package:cleaner/screens/login_page.dart';
import 'package:cleaner/widgets/app_text_bold.dart';
import 'package:cleaner/widgets/app_text_normal.dart';
import 'package:cleaner/widgets/blinking_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageValue = 0;

  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  List images = [
    "/images/splash1.jpg",
    "/images/splash4.jpg",
    "/images/splash5.jpg",
  ];

  //filler text
  List<String> textHeader = [
    "lorem ipsum",
    "lorem ipsum",
    "lorem ipsum",
  ];
  List<String> textSubHeader = [
    "lorem ipsum",
    "lorem ipsum",
    "lorem ipsum",
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (i) => setState(() {
                pageValue = 1;
              }),
              itemCount: images.length,
              itemBuilder: (ctx, index){
                return Container(
                  padding: const EdgeInsets.only(top: 55, left: 20, right: 20),

                  //Background
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.darken),
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //Text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextBold(text: textHeader[index]),
                      AppTextNormal(
                        text: textSubHeader[index],
                        size: 25,
                      ),
                    ],
                  ),
                );
              },
            ),
            //Slider Indicator
            Positioned(
              right: MediaQuery.of(context).size.width / 2 - 60,
              bottom : 10,
              child: Row(
                children: List.generate(
                  images.length, 
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 8,
                    width: pageValue == index ? 30 : 8,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: pageValue == index ? Colors.orange : Colors.grey,
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                ),
              ),
            ),
            //button
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2,
              child: BlinkingButton(
                onTap: (){
                  if (pageValue + 1 < images.length){
                    _pageController.animateToPage(
                      pageValue + 1,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    );
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                  }
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}