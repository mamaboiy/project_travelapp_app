// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/hotel_data/guide_list.dart';
// import 'package:batch_or/hotel_page/guide_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_travelapp_app/List/guideList.dart';
import 'package:project_travelapp_app/Pages/guideSecondPage.dart';
import 'package:project_travelapp_app/constant/constant.dart';

class tourist_guide extends StatefulWidget {
  const tourist_guide({super.key});

  @override
  State<tourist_guide> createState() => _guideState();
}

class _guideState extends State<tourist_guide> {
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
                  text: 'Guide ',
                ),
              ),
              Icon(
                CupertinoIcons.person,
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
                Gap(20),
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
                Gap(20),
                GridView.builder(
                  itemCount: guide.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Card(
                        elevation: 10,
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                                image: DecorationImage(
                                    image: AssetImage('${guide[index].img}'),
                                    fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              padding: EdgeInsets.all(12),
                              height: 210,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${guide[index].phone} ',
                                        style: myStyle(
                                            16, Colors.black, FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Gap(15),
                                  Text(
                                    '${guide[index].name}',
                                    style: myStyle(
                                        20, primaryColor, FontWeight.bold),
                                  ),
                                  Text(
                                    'Age :' '${guide[index].age}',
                                    style: myStyle(
                                        18, secondaryColor, FontWeight.bold),
                                  ),
                                  Text(
                                    '${guide[index].experience}' ' Experience',
                                    style: myStyle(
                                        18, thirdColor, FontWeight.bold),
                                  ),
                                  Center(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (builder) => gchats(
                                                    guideClass: guide[index],
                                                  )));
                                    },
                                    child: Card(
                                      elevation: 4,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 1),
                                        height: 40,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Color(0xff023e8a),
                                            Color(0xff0077b6),
                                            Color(0xff0096c7)
                                          ]
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Message',
                                          style: myStyle(20, Colors.white,
                                              FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ))
                                ],
                              )),
                        ],
                      )
                    ]);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
