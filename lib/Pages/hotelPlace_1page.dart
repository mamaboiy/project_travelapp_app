// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/doctor%20data/medicine_list.dart';
// import 'package:batch_or/hotel_data/hotel_list.dart';
// import 'package:batch_or/hotel_data/place_list.dart';
// import 'package:batch_or/hotel_page/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_travelapp_app/List/hotelPlaceList.dart';
import 'package:project_travelapp_app/List/placeList.dart';
import 'package:project_travelapp_app/Pages/hotelpage.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/hotelPlaceModel.dart';
import 'package:project_travelapp_app/models/placemodel.dart';

class hotproj extends StatefulWidget {



  const hotproj({super.key});

  @override
  State<hotproj> createState() => _hotprojState();
}

class _hotprojState extends State<hotproj> {
  TextEditingController _searchController= TextEditingController();
  List<PlaceClass>places=place;
  List<PlaceClass>_searchResult=[];



  void _performsearch(){
    String query = _searchController.text;
    if(query.isEmpty){
      setState(() {
        _searchResult=place;

      });
      return;
    }
    List<PlaceClass>results=place
        .where((items)=>items.name.toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      _searchResult=results;
    });


  }


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
                    text: ' Explore',
                  ),
                ),
                Icon(
                  CupertinoIcons.placemark,
                  size: 30,
                  color: primaryColor,
                ),
              ],
            ),
            actions: [Icon(Icons.more_vert)],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Regions',
                        style: myStyle(25, Color(0xff023e8a), FontWeight.bold),
                      ),
                      Spacer(),
                      Stack(clipBehavior: Clip.none, children: [
                        Container(
                            child: Icon(
                              Icons.notifications_none,
                              size: 30,
                            )),
                        Positioned(
                          left: 13,
                          top: 5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                                border: Border.all(color: Colors.white, width: 20)),
                          ),
                        )
                      ])
                    ],
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search,Bhutan',
                            suffixIcon: InkWell(onTap: _performsearch,
                                child: Icon(Icons.search)),
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
                  Gap(20),
    Column(
    children: [
    SizedBox(
    width: double.infinity,
    child: ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: place.length,
    shrinkWrap: true,
    // scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
    return InkWell(
    onTap: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (builder) =>
    med(difhot:difhot[index],placeClass:place[index] ,)));
    },
    child: Stack(children: [
    Card(
    elevation: 10,
    margin: EdgeInsets.only(bottom: 20),
    child: Container(
    padding: EdgeInsets.all(5),

    height:
    MediaQuery.of(context).size.height * 0.3,
    width: MediaQuery.of(context).size.width * 0.9,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    image: DecorationImage(
    image: AssetImage(
    '${place[index].imgurl}'),
    fit: BoxFit.fill)),
    ),
    ),
    Positioned(
    top: 150,
    child: Center(
    child: Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(0),
    height: 100,
    width: 389.1,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.black54,
    ),
    child: Text(
    '${place[index].name}',
    style: GoogleFonts.aBeeZee(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold),
    ),
    ),
    ))
    ]),
    );
    },
    ),
    )
    ],
    )])))));
  }
}


