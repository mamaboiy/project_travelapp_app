// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/hotel_data/hotel_list.dart';
// import 'package:batch_or/hotel_model/hotel_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/hotelModel.dart';
import 'package:url_launcher/url_launcher.dart';

class abthotel extends StatefulWidget {
  HotelClass hotelClass;

  abthotel({super.key, required this.hotelClass});

  @override
  State<abthotel> createState() => _abthotelState();
}

class _abthotelState extends State<abthotel> {
  double rating = 3.5;
  int starCount = 5;

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
                  text: 'Hotail Details ',
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: InstaImageViewer(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${widget.hotelClass.imgurl}"),
                                                fit: BoxFit.none)),
                                      ),
                                    )),
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: InstaImageViewer(
                                            child: Container(
                                              margin: EdgeInsets.only(right: 5),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          '${widget.hotelClass.imgurl2}'),
                                                      fit: BoxFit.none)),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: InstaImageViewer(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          '${widget.hotelClass.imgurl3}'),
                                                      fit: BoxFit.none)),
                                            ),
                                          )),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.hotelClass.name}                                          ',
                            style: myStyle(30, primaryColor, FontWeight.bold),
                          ),

                          Gap(5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xffc1121f),
                              ),
                              Text(
                                "${widget.hotelClass.location}",
                                style:
                                    myStyle(18, thirdColor, FontWeight.bold),
                              )
                            ],
                          ),
                          Gap(5),
                          InkWell(
                            onTap: (){
                              launchUrl(
                                Uri.parse("tel:${widget.hotelClass.abt}"),);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.call,color: Colors.green,),
                                Text(
                                  ' ${widget.hotelClass.abt}',
                                  style:
                                      myStyle(18, Colors.black, FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Gap(2),
                          Text(
                            ' ',
                            style: myStyle(15, Colors.black, FontWeight.bold),
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Gap(10),
                          Text(
                            'About this Property',
                            style: myStyle(20, Colors.black, FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to'
                                ' ${widget.hotelClass.name} '
                                '$abthotel1'
                                '${widget.hotelClass.location} '
                                '$abthotel2',
                                style: myStyle(
                                  16,
                                  Colors.black,
                                ),
                              ),
                              Divider(
                                thickness: 0.4,
                              ),
                              Gap(10),
                              Text(
                                maxLines: 2,
                                'Accomodation',
                                style:
                                    myStyle(20, Colors.black, FontWeight.bold),
                              ),
                              Text(
                                'Our well-appointed rooms and suites are designed with your comfort in mind. Each room features:- ',
                                style: myStyle(
                                  16,
                                  Colors.black,
                                ),
                              ),
                              Gap(4),
                              Text(
                                ' • Comfortable beds with premium linens',
                                style: myStyle(
                                  16,
                                  Colors.black,
                                ),
                              ),
                              Text(
                                ' • Free high-speed Wi-Fi',
                                style: myStyle(
                                  16,
                                  Colors.black,
                                ),
                              ),
                              Text(
                                ' • Modern bathrooms with complimentary toiletries',
                                style: myStyle(
                                  16,
                                  Colors.black,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 0.4,
                          ),
                          Gap(10),
                          Text(
                            'Location',
                            style: myStyle(20, Colors.black, FontWeight.bold),
                          ),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/map.png'))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(10),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textScaleFactor: 1.4,
                          ' ${widget.hotelClass.price}',
                          style: myStyle(20, Colors.white, FontWeight.bold),
                        ),
                        Text(
                          '   Per Night (2 Adults)',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.only(right: 15),
                        elevation: 10,
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color(0xff1e88e5),
                              borderRadius: BorderRadius.circular(0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'BOOK NOW',
                                style: myStyle(
                                    25, Colors.white, FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
