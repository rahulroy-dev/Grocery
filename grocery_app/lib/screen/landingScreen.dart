import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screen/Logout.dart';
import 'package:grocery_app/screen/home.dart';
import 'package:grocery_app/screen/offer.dart';
import 'package:grocery_app/screen/orderhistory.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Color bgColor = Colors.teal.shade400;
  LinearGradient bg1 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.5, 0.7, 0.9],
    colors: [
      Colors.purple.shade700,
      Colors.purple.shade600,
      Colors.purple.shade500,
      Colors.purple.shade400,
    ],
  );
  int currentIndex = 0;

  final iconList = <IconData>[
    CupertinoIcons.home,
    CupertinoIcons.gift,
    Icons.shopping_cart_outlined,
    Icons.person
  ];
  final labelList = <String>[
    "Home",
    "Offer",
    "Order History",
    "Profile",
  ];
  var pageList = [Home_page(), Offer(), OrderHistory(), LogoutAlert()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bg1),
      child: Scaffold(
        backgroundColor: Color(0x00000000),
        body: pageList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: bgColor,
          backgroundColor: Color(0x00000000),
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFFFFFFFF),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          items: List.generate(
            pageList.length,
            (index) => BottomNavigationBarItem(
              label: labelList[index],
              icon: Container(
                width: 60,
                height: 55,
                decoration: currentIndex == index
                    ? BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFffa366), Color(0x0000)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [.1, .1]))
                    : BoxDecoration(),
                //color: currentIndex == index ? Colors.yellow : bgColor,
                child: Icon(
                  iconList[index], size: 30,

                  // color:
                  //     currentIndex == index ? Colors.amber[700] : Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
