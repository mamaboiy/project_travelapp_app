import 'dart:io';

// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/hotel_data/guide_list.dart';
// import 'package:batch_or/hotel_model/guide_class.dart';
// import 'package:batch_or/hotel_page/guide_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/guideModel.dart';

class gchats extends StatefulWidget {
  GuideClass guideClass;

  gchats({super.key, required this.guideClass});

  @override
  State<gchats> createState() => _chatsState();
}

class _chatsState extends State<gchats> {
  File? _image;

  Future imageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }

  Future imageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _image = File(returnImage!.path);
    });
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController _firstname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all(color: primaryColor)),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
              ///back_arrow
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  )),
              Gap(10),
              
              ///app_bar
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('${widget.guideClass.img}'),
                        fit: BoxFit.contain)),
              ),
              Text(
                '   ${widget.guideClass.name}',
                style: myStyle(19, Colors.black, FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.videocam,
                color: primaryColor,
                size: 25,
              ),
              Gap(8),
              Icon(
                Icons.call,
                color: primaryColor,
                size: 25,
              ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Today')],
                    ),
                    Gap(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              width: 250,
              child: Column(
                children: [
                  Text(
                    'Hi'
                    ' ${widget.guideClass.name}'
                    ' ,can you brief me for the trip,and the cost?',
                    style: myStyle(15, Colors.black, FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('✓✓ ', style: TextStyle(color: Colors.blue)),
                      Text('3.10')
                    ],
                  ),
                ],
              ),
                        )
                      ],
                    ).animate().scaleXY(
              duration: Duration(milliseconds: 400),
                        ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
              decoration: BoxDecoration(color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/trip.png'),
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high)),
              margin: EdgeInsets.only(right: 10),
              height: 120,
              width: 170,
                        ),
                      ],
                    ).animate().scaleXY(
              duration: Duration(milliseconds: 400),
              delay: Duration(milliseconds: 700),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
              Text('✓✓ ', style: TextStyle(color: Colors.blue)),
              Text(' 3.11')
                        ],
                      ),
                    ).animate().scaleXY(
                        duration: Duration(milliseconds: 400),
                        delay: Duration(milliseconds: 700)),
                    Gap(357),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 70,
                      color: primaryColor,
                      child: Row(
                        children: [
              InkWell(
                  onTap: () {
                    imageFromGallery();
                  },
                  child: Icon(
                    Icons.photo_album_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
              Gap(5),
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.69,
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _firstname,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white)),
                            // suffix: Icon(Icons.drive_file_rename_outline)
                            // prefix: Icon(Icons.account_box)
                          )),
                    )
                  ],
                ),
              ),
              Gap(6),
              InkWell(
                onTap: () {
                  imageFromCamera();
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Gap(10),
              Icon(
                Icons.mic,
                size: 30,
                color: Colors.white,
              )
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}
