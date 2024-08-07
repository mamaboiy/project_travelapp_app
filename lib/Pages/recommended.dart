import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_travelapp_app/List/PlaceData.dart';
import 'package:project_travelapp_app/Pages/guidePage1.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/placemodel.dart';
class PlaceDetails extends StatelessWidget {
  Placemodel placemodel;
   PlaceDetails({super.key, required this.placemodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: myStyle(25, primaryColor, FontWeight.bold),
                text: 'Travel ',
              ),
            ),
            Icon(
              CupertinoIcons.globe,
              size: 30,
              color: primaryColor,
            ),
          ],
        ),
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
        body: SingleChildScrollView(
          child: Container(
            // color: Color(0xfffaedcd),
            width: double.infinity,
            child: Column(children: [
              Hero(
                tag: '${placemodel.place_name}',
                child: Card(
                  shadowColor: Colors.grey,
                  elevation: 5,
                  child: Image.asset("${placemodel.imgUrl}",fit: BoxFit.fitWidth, ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70.withOpacity(0.4),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_pin,
                              color: Colors.redAccent,),
                            Text(
                              "${placemodel.location}",
                              style: myStyle(23, primaryColor, FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),

                        Text("Nu.${placemodel.price}",style: myStyle(20,secondaryColor,FontWeight.bold),),

                      ],
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Icon(Icons.star,size: 20,
                          color: secondaryColor,),
                        Text("${placemodel.rating}", style: myStyle(18, Colors.black, FontWeight.bold)
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 110,
                          child: Text(
                            "${placemodel.place_name}",
                            style: myStyle(20, thirdColor, FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 260,
                          child: Divider(height: 5),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      children: [
                         Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("${placemodel.detail}", style:GoogleFonts.comicNeue(
                                fontSize: 18, // Optional font size
                                color: Colors.black,
                                fontWeight: FontWeight.normal// Optional font color
                              ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),

              ),
              SizedBox(height: 30,),
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
                      child: Text("Book a Guide!!! ",style: myStyle(23,Colors.white,FontWeight.bold),)
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
            ),
          ),
        )


      ///
    );
  }
}
