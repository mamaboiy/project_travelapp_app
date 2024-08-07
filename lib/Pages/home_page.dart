import 'dart:io';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_travelapp_app/List/LoginList.dart';
import 'package:project_travelapp_app/List/PlaceData.dart';
import 'package:project_travelapp_app/Pages/Login_page.dart';
import 'package:project_travelapp_app/Pages/Place_Page.dart';
import 'package:project_travelapp_app/Pages/carServices_page.dart';
import 'package:project_travelapp_app/Pages/guidePage1.dart';
import 'package:project_travelapp_app/Pages/hotelPlace_1page.dart';
import 'package:project_travelapp_app/Pages/recommended.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/placemodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  Future imageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }

  bool click=false;
  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // RichText(
              //   text: TextSpan(
              //     style: myStyle(35, primaryColor, FontWeight.bold),
              //     text: 'Get-A-Way ',
              //   ),
              // ),
              Container(
                // margin: EdgeInsets.all(10),
                height: 160,
                width: 160,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: AssetImage('assets/images/headlogo.png'),),
                ),
              ),

            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('${login[0].firstname}'),
                  accountEmail: Text('${login[0].email}'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('assets/images/Profile.png',fit: BoxFit.cover,),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),fit:BoxFit.cover),
                ),
              ),
              ListTile(
                leading: Icon(Icons.upload),
                title: Text('Upload'),
                onTap: (){
                  imageFromGallery();
                },
              ),ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: (){

                },
              ),ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: (){

                },
              ),ListTile(
                leading: Icon(Icons.line_axis),
                title: Text('Stats'),
                onTap: (){

                },
              ),ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: (){

                },
              ),ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: (){

                },
              ),ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: (){

                },
              ),ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign Out'),
                onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>hotel_registration()), (route)=>false);
                },
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Location',
                          style: myStyle(22, primaryColor, FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.location_solid,color: Color(0xffc1121f),),
                            Text(
                              'Thimphu, Bhutan',
                              style: myStyle(25, null, FontWeight.w500),
                            ),
                            Icon(
                              CupertinoIcons.chevron_down,
                              size: 17,
                              color: secondaryColor,
                            ),
                          ],
                        ),
                        Icon(
                          CupertinoIcons.bell,
                          color: primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                ///search
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
                SizedBox(
                  height: 30,
                ),

                ///
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: myStyle(20, primaryColor, FontWeight.w500),
                    ),
                    InkWell(
                      onTap: (){
                        if (click==false){
                          setState(() {
                            click=true;
                          });
                        }
                        else{
                          setState(() {
                            click=false;
                          });
                        }
                      },
                      child: Text(
                        'See all',
                        style: myStyle(18, Colors.grey, FontWeight.w400),
                      ),
                    ),
                  ],
                ),

                ///place name
                SizedBox(
                  height: 20,
                ),
               click? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>tourist_guide()));
                        },
                        child: Card(
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/person.png",
                                  width: 80,
                                ),
                                Text(
                                  "Tour Guide",
                                  style: myStyle(
                                      13, primaryColor, FontWeight.w600),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>hotproj()));
                        },
                        child: Card(
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/hotel.png",
                                  width: 80,
                                ),
                                Text(
                                  "Hotel",
                                  style: myStyle(
                                      13, primaryColor, FontWeight.w600),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>PlacePage()));
                        },
                        child: Card(
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/place.png",
                                    width: 80),
                                Text(
                                  "Best Place",
                                  style: myStyle(
                                      13, primaryColor, FontWeight.w600),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CarservicesPage()));
                        },
                        child: Card(
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/car.png",
                                    width: 80),
                                Text(
                                  "Car Services",
                                  style: myStyle(
                                      13, primaryColor, FontWeight.w600),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ): SizedBox(width: 50,),

                SizedBox(
                  height: 30,
                ),

                Row(
                  children: [
                    Container(
                        width: 150,
                        child: Text(
                          'Recommended',
                          style: myStyle(20, primaryColor, FontWeight.w500),
                        )),
                    Container(
                      width: 240,
                      child: Divider(
                        height: 5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: allplace.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 3,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (builder) =>
                                PlaceDetails(placemodel: allplace[index]),
                          ),
                        );
                      },
                      child: Card(
                        shadowColor: primaryColor,
                        elevation: 4,
                        child: Hero(
                          tag:'${allplace[index].place_name}' ,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage('${allplace[index].imgUrl}'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  // alignment: Alignment.center,
                                  height: 95,
                                  width: 180,
                                  // height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12.withOpacity(0.4),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(Icons.location_pin,color: Colors.redAccent,),
                                            ],
                                          ),
                                          Text(
                                            "${allplace[index].place_name}",
                                            style: myStyle(20, Colors.white,
                                                FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: secondaryColor,
                                          ),
                                          Text(
                                            " ${allplace[index].rating}",
                                            style: myStyle(16, Colors.white,
                                                FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                ///last
              ],
            ),
          ),
        ),
      ),
    );
  }
}

