import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelapp_app/Pages/Place_Page.dart';
import 'package:project_travelapp_app/Pages/carServices_page.dart';
import 'package:project_travelapp_app/Pages/home_page.dart';
import 'package:project_travelapp_app/Pages/hotelPlace_1page.dart';
import 'package:project_travelapp_app/Pages/hotelpage.dart';
import 'package:project_travelapp_app/constant/constant.dart';

class buttomnavbar extends StatefulWidget {
  const buttomnavbar({super.key});

  @override
  State<buttomnavbar> createState() => _buttomnavbarState();
}

class _buttomnavbarState extends State<buttomnavbar> {
  List list = [
    HomePage(),
    hotproj(),
    PlacePage(),
    CarservicesPage(),
  ];

  List<Icon>allItems=[
    Icon(Icons.home,color: primaryColor),
    Icon(Icons.location_city,color: primaryColor),
    Icon(Icons.location_pin,color: primaryColor),
    Icon(Icons.car_crash_outlined,color: primaryColor),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: primaryColor,
        // animationDuration: Duration(milliseconds:500),
        animationCurve: Curves.decelerate,
        index: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          }
          );
        },
        items: allItems,
      ),
    );
  }
}
