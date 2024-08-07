import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_travelapp_app/Pages/guidePage1.dart';
import 'package:project_travelapp_app/constant/constant.dart';

class bestPlacePage extends StatelessWidget {
  final String bestPlace;
  final String imageUrl;
  final String location;
  final String price;
  final double rating;

  const bestPlacePage({
    Key? key,
    required this.bestPlace,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(bestPlace, style: myStyle(22, primaryColor, FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Hero(
              tag: '$bestPlace',
              child: Container(
                margin: EdgeInsets.all(5),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin,color: Colors.redAccent,),
                        Text(
                          location,
                          style: myStyle(20, thirdColor, FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      price,
                      style: myStyle(18, secondaryColor, FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: secondaryColor,
                    ),
                    Text(
                      rating.toString(),
                      style: myStyle(18, Colors.black, FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 75,
                  child: Text(
                    'About',
                    style: myStyle(20, primaryColor, FontWeight.w500),
                  ),
                ),
                Container(
                  width: 310,
                  child: Divider(height: 5),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  '$bestPlace' ' $des',
                  style: GoogleFonts.comicNeue(
                      fontSize: 18, // Optional font size
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color(0xff023e8a),
                    Color(0xff0077b6),
                    Color(0xff0096c7)
                  ]
                  ),
                ),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    minWidth: MediaQuery.of(context).size.width*0.8,
                    height:MediaQuery.of(context).size.height*0.09,
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>tourist_guide()));
                    },
                    child: Text("Book a Guide",style: myStyle(23,Colors.white,FontWeight.bold),)
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
