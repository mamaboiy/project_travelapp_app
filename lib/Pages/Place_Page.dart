import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_travelapp_app/List/PlaceData.dart';
import 'package:project_travelapp_app/Pages/bestPlace_page.dart';
import 'package:project_travelapp_app/constant/constant.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({super.key});

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  final List<String> imgList = [
    'assets/images/buddhaPoint.jpg',
    'assets/images/chele.jpg',
    'assets/images/chimiLhakhang.jpg',
    'assets/images/Drukgyel.jpg',
    'assets/images/Ha.jpg',
    'assets/images/Jomolhari.jpg',
    'assets/images/Khamsum.jpg',
    'assets/images/Kurjey.jpg',
    'assets/images/Laya.jpg',
    'assets/images/memorialchhorten.jpg',
    'assets/images/Mongar.jpg',
    'assets/images/paro.jpg',
    'assets/images/paromuseum.jpg',
    'assets/images/phobjikha.jpg',
    'assets/images/punakhadzong.jpg',
    'assets/images/punakhasuspension.jpg',
    'assets/images/Samdrupj.jpg',
    'assets/images/tagtsang.jpg',
    'assets/images/Takinpark.jpg',
    'assets/images/Tashichhoedzong.jpg',
    'assets/images/Trashigang.jpg',
    'assets/images/trongsa.jpg',
  ];

  int _currentPage = 0;

  List<Widget> generateImagesTiles() {
    return imgList
        .map(
          (_element) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              _element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

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
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 20),

              /// Search
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search, Best place in Bhutan',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 16.0,
                        ),
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
              SizedBox(height: 30),

              /// Image carousel
              Container(
                child: CarouselSlider(
                  items: generateImagesTiles(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    height: 260,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      'Best place to visit in Bhutan',
                      style: myStyle(20, primaryColor, FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: 240,
                    child: Divider(height: 5),
                  ),
                ],
              ),
              SizedBox(height: 15),

              /// place list
              Container(
                height: 4100, // Fixed height for the ListView
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  // padding: EdgeInsets.all(5.0),
                  children: [
                    PlaceCard(
                      name: 'Buddha Dordenma statue',
                      location: 'Kuenselphodrang, Thimphu',
                      price: '\Nu.1500',
                      imageUrl: 'assets/images/buddhaPoint.jpg',
                      rating: 4.7,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Buddha Dordenma statue',
                              imageUrl: 'assets/images/buddhaPoint.jpg',
                              location: 'Kuenselphodrang, Thimphu',
                              price: '\Nu.1500',
                              rating: 4.7,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Chele Pass',
                      location: 'Haa and Paro valleys.',
                      price: '\Nu.1500',
                      imageUrl: 'assets/images/chele.jpg',
                      rating: 4.7,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Chele Pass',
                              imageUrl: 'assets/images/chele.jpg',
                                location: 'Haa and Paro valleys.',
                                price: '\Nu.1500',
                                rating: 4.7,
                              // name: 'Chele Pass',
                              //   location: 'Haa and Paro valleys.',
                              //   price: '\Nu.1500',
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Drukgyel Dzong',
                      location: 'Drugyel Dzong, Chuyul',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/Drukgyel.jpg',
                      rating: 4.8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Drukgyel Dzong',
                              imageUrl: 'assets/images/Drukgyel.jpg',
                              location: 'Drugyel Dzong, Chuyul',
                              price: 'Nu.15000',
                              rating: 4.8,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Mt Jomolhari',
                      location: 'Paro district of Bhutan',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/Jomolhari.jpg',
                      rating: 4.3,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Mt Jomolhari',
                              imageUrl: 'assets/images/Jomolhari.jpg',
                              location: 'Paro district of Bhutan',
                              price: 'Nu.15000',
                              rating: 4.3,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Khamsum Yulley Namgyal Chorten',
                      location: 'Phunakha district ',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/Khamsum.jpg',
                      rating: 4.8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Khamsum Yulley Namgyal Chorten',
                              imageUrl: 'assets/images/Khamsum.jpg',
                              location: 'Phunakha district ',
                              price: 'Nu.15000',
                              rating: 4.8,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Kurjey Lhakhang',
                      location: 'HPPJ+R4R, Jakar ',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/Kurjey.jpg',
                      rating: 4.7,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Kurjey Lhakhang',
                              imageUrl: 'assets/images/Kurjey.jpg',
                              location: 'HPPJ+R4R, Jakar ',
                              price: 'Nu.15000',
                              rating: 4.7,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Laya',
                      location: 'Gasa, northwestern Bhutan',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/Laya.jpg',
                      rating: 4.6,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Laya',
                              imageUrl: 'assets/images/Laya.jpg',
                              location: 'Gasa, northwestern Bhutan',
                              price: 'Nu.15000',
                              rating: 4.6,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Memorial Chhorten',
                      location: 'Chhoten Lam, Thimphu',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/memorialchhorten.jpg',
                      rating: 4.7,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Memorial Chhorten',
                              imageUrl: 'assets/images/memorialchhorten.jpg',
                              location: 'Chhoten Lam, Thimphu',
                              price: 'Nu.15000',
                              rating: 4.7,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Paro',
                      location: 'Paro',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/paro.jpg',
                      rating: 4.6,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Paro',
                              imageUrl: 'assets/images/paro.jpg',
                              location: 'Paro',
                              price: 'Nu.15000',
                              rating: 4.6,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'National Museum of Bhutan',
                      location: 'Paro',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/paromuseum.jpg',
                      rating: 4.3,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'National Museum of Bhutan',
                              imageUrl: 'assets/images/paromuseum.jpg',
                              location: 'paro',
                              price: 'Nu.15000',
                              rating: 4.3,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlaceCard(
                      name: 'Phobjikha Valley',
                      location: 'Phobjikha',
                      price: 'Nu.15000',
                      imageUrl: 'assets/images/phobjikha.jpg',
                      rating: 4.8,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bestPlacePage(
                              bestPlace: 'Phobjikha Valley',
                              imageUrl: 'assets/images/phobjikha.jpg',
                              location: 'Phobjikha',
                              price: 'Nu.15000',
                              rating: 4.8,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String imageUrl;
  final double rating;
  final VoidCallback onTap;

  const PlaceCard({
    Key? key,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag:'$name',
                    child: Card(
                      elevation: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(imageUrl),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(name,
                    style: myStyle(22, primaryColor, FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(location, style: myStyle(19, thirdColor, FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(price, style: myStyle(19, secondaryColor, FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
