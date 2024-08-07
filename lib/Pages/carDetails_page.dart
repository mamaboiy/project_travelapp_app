import 'package:flutter/material.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/CarModel.dart';
class CarDetailPage extends StatelessWidget {
  final Car car;
  const CarDetailPage({required this.car, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name,style: myStyle(22,primaryColor,FontWeight.bold),),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: car.name,child: Container(child: Image.asset(car.imageUrl)
                ),
                ), // Replace with actual image
                SizedBox(height: 20),
                Text(car.name, style: myStyle(22, primaryColor,FontWeight.bold)),
                SizedBox(height: 10),
                Text(car.transmission, style: myStyle(18,thirdColor,FontWeight.bold)),
                SizedBox(height: 10),
                Text("Nu${car.price}/day", style: myStyle(20,secondaryColor,FontWeight.bold)),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Image.asset('assets/icons/left.gif',height: 100,width: 100,),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff023e8a),
                      Color(0xff0077b6),
                      Color(0xff0096c7)
                    ]
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: MaterialButton(

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      minWidth: MediaQuery.of(context).size.width*0.6,
                      height:MediaQuery.of(context).size.height*0.09,
                      onPressed: (){},
                      child: Text("Book Now!!! ",style: myStyle(22,Colors.white,FontWeight.bold),)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
