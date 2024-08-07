// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/doctor%20data/medicine_list.dart';
// import 'package:batch_or/doctor%20data/pharmacy_list.dart';
// import 'package:batch_or/doctor%20model/medicine_class.dart';
// import 'package:batch_or/doctor%20model/pharmacy_class.dart';
// import 'package:batch_or/doctor%20page/medicine_page2.dart';
// import 'package:batch_or/hotel_data/hotel_list.dart';
// import 'package:batch_or/hotel_data/place_list.dart';
// import 'package:batch_or/hotel_model/place_class.dart';
// import 'package:batch_or/hotel_page/hotel_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_travelapp_app/Pages/hotel_3detail.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/hotelPlaceModel.dart';

class med extends StatefulWidget {
  List difhot;
  PlaceClass placeClass;

  med({super.key, required this.difhot, required this.placeClass});

  @override
  State<med> createState() => _medicineState();
}

class _medicineState extends State<med> {
  double rating = 3.5;
  int starCount = 5;

  final _formkey = GlobalKey<FormState>();
  TextEditingController _firstname = TextEditingController();
  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: myStyle(25, primaryColor, FontWeight.bold),
                  text: 'Hotels ',
                ),
              ),
              Icon(
                CupertinoIcons.house,
                size: 30,
                color: primaryColor,
              ),
            ],
          ),
          actions: [Icon(Icons.more_vert)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Stack(children: [
                      Container(
                          child: Icon(
                        Icons.notifications_none,
                        size: 30,
                      )),
                      Positioned(
                        left: 13,
                        top: 6,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        ),
                      )
                    ])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Color(0xff9d0208)),
                    Text(
                      '${widget.placeClass.name}',
                      style: myStyle(30, primaryColor, FontWeight.bold),
                    ),
                    // Text('Pain Relief                                    '
                    //     '                  ',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff333533)))
                  ],
                ).animate().slideX(duration: Duration(milliseconds: 400)),
                SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Form(
                            key: _formkey,
                            child: Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search,Bhutan',
                                        suffixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
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
                                      icon:
                                          Icon(Icons.tune, color: Colors.white),
                                      onPressed: () {
                                        /// Handle filter icon press
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ])),
                        Gap(20),
                        Gap(20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.difhot.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => abthotel(
                                        hotelClass: widget.difhot[index])));
                              },
                              child: Card(
                                margin: EdgeInsets.only(bottom: 20),
                                shadowColor: Colors.blueGrey,
                                elevation: 10,
                                child:
                                    Stack(clipBehavior: Clip.none, children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor,
                                              ),
                                              child: Center(
                                                  child: Text(
                                                '$rating',
                                                style: myStyle(18, Colors.white,
                                                    FontWeight.bold),
                                              )),
                                            ),
                                            Text(
                                              'Very Good',
                                              style: myStyle(15, primaryColor,
                                                  FontWeight.bold),
                                            ),
                                            Text(
                                              '  (4372 reviews)',
                                              style: myStyle(12),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '  ${widget.difhot[index].name}',
                                              style: myStyle(30, primaryColor,
                                                  FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "   ${widget.difhot[index].price}",
                                              style: myStyle(20, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            Spacer(),
                                            StarRating(
                                              size: 20,
                                              rating: rating,
                                              color: Colors.orange,
                                              borderColor: Colors.grey,
                                              allowHalfRating: true,
                                              starCount: starCount,
                                              onRatingChanged: (rating) =>
                                                  setState(() {
                                                this.rating = rating;
                                              }),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      height: 250,
                                      width: MediaQuery.of(context).size.width *
                                          0.99,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  '${widget.difhot[index].imgurl}'),
                                              fit: BoxFit.none)),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
