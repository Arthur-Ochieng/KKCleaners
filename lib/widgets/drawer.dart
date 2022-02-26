import 'dart:html';

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
      width: MediaQuery.of(context).size.width* 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "/KK.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}

