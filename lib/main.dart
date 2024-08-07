import 'package:flutter/material.dart';
import 'package:project_travelapp_app/Pages/Login_page.dart';
// import 'package:project_travelapp_app/Pages/Expanded.dart';
import 'package:project_travelapp_app/Pages/home_page.dart';
import 'package:project_travelapp_app/Pages/hotelPlace_1page.dart';
import 'package:project_travelapp_app/Pages/splash_page.dart';
// import 'package:project_travelapp_app/Pages/image.dart';
// import 'package:project_travelapp_app/Pages/image2.dart';
// import 'package:project_travelapp_app/Pages/recommended.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

