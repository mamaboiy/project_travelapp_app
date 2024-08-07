import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:project_travelapp_app/Pages/carDetails_page.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/CarModel.dart';

class CarservicesPage extends StatefulWidget {
  const CarservicesPage({super.key});

  @override
  State<CarservicesPage> createState() => _CarservicesPageState();
}

class _CarservicesPageState extends State<CarservicesPage> {
  final List<Car> cars = [
    Car(
      name: "Kia Sportage/ Creta/Santafe",
      transmission: "Automatic/Manual",
      imageUrl: "assets/images/Creta.png",
      price: 1500,
      person:1 - 2,
    ),
    Car(
      name: "Toyota Hiace bus / H1	",
      transmission: "Automatic/Manual",
      imageUrl: "assets/images/Toyota.png",
      price: 2000,
      person:3- 4,
    ),
    Car(
      name: "Toyota Highroof",
      transmission: "Automatic/Manual",
      imageUrl: "assets/images/Highroof.png",
      price: 2500,
      person:4 - 6 ,
    ),
    Car(
      name: "Toyota Coaster Bus",
      transmission: "Automatic/Manual",
      imageUrl: "assets/images/Coaster.png",
      price: 4000,
      person:6 -9 ,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: myStyle(25, primaryColor, FontWeight.bold),
                text: ' Car ',
              ),
            ),
            Icon(
              CupertinoIcons.car_detailed,
              size: 30,
              color: primaryColor,
            ),
          ],
        ),
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search,Bhutan',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff023e8a),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune, color: Colors.white),
                      onPressed: () {
                        /// Handle filter icon press
                      },
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              Text("Services Car", style:myStyle(22,primaryColor,FontWeight.bold)),
              SizedBox(height: 20),
              Column(
                children: cars.map((car) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailPage(car: car),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(car.name, style:myStyle(18,primaryColor,FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(car.transmission, style:myStyle(18,thirdColor,FontWeight.bold)),
                          SizedBox(height: 10),

                          Hero(
                            tag: car.name,
                            child: Container(
                              child: Image.asset(car.imageUrl).animate().slideX(
                                duration: Duration(milliseconds: 300),
                                begin: 1, // start from right
                              ),
                            ),
                          ),
                          // Replace with actual car image
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff023e8a),
                                Color(0xff0077b6),
                                Color(0xff0096c7)
                              ]
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("Nu.${car.price}/day", style: myStyle(18,Colors.white,FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
