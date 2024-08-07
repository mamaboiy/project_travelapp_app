import 'dart:async';

// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/doctor%20page/bottom_bar.dart';
// import 'package:batch_or/doctor%20page/homePage.dart';
// import 'package:batch_or/doctor%20page/hospitasl_page.dart';
// import 'package:batch_or/hotel_page/login_page.dart';
// import 'package:batch_or/page/1home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_travelapp_app/Pages/Login_page.dart';
import 'package:project_travelapp_app/Pages/Registration_page.dart';
import 'package:project_travelapp_app/Pages/bottomNavBAr.dart';
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 5), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)
    =>RegistrationPage())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/backsplash.webp'),fit: BoxFit.none)),
            child: Column(     mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                    children:[ Container(
                      height: 400,width: 410,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/1sp.png'),fit:
                      BoxFit.contain)),

                    ).animate().shimmer(duration: Duration(seconds: 5),delay: Duration(milliseconds: 1500)).slideY(duration: Duration(milliseconds: 400),begin: 2),
                      Positioned(
                          top: 205,
                          child: Container(height: 90,width: 380,
                            decoration: BoxDecoration(image:
                            DecorationImage(image: AssetImage('assets/images/2sp.png'),fit:
                            BoxFit.none)),)).animate().shimmer(duration: Duration(seconds: 0),delay: Duration(milliseconds: 1000)).slideX(duration: Duration(milliseconds: 300),delay:Duration(milliseconds: 2000),begin: 2 )
                    ] ),
                Gap(20),
                Column(mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('Powered by; WanderWave ',style:GoogleFonts.comicNeue(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)).animate().fade().scale(duration: Duration(seconds: 3))

                  ],),
                Gap(300),

              ],
            ),
          ),

        )
    );
  }
}
