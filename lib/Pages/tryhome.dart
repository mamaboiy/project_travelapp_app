// final List<String> imgList = [
//   "assets/images/images.jpg",
//   "assets/images/images.png",
//   "assets/images/images.png",
//   "assets/images/images.png",
//   "assets/images/images.png",
//   "assets/images/images.png",
//
// ];
// List<Widget> generateImagesTiles() {
//   return imgList
//       .map((_element) => ClipRRect(
//     child: Image.asset(
//       _element,
//       fit: BoxFit.cover,
//     ),
//     borderRadius: BorderRadius.circular(15),
//   )
//   ).toList();
// }
///
// carousel
// Container(
// child: CarouselSlider(
// items: generateImagesTiles(),
// options: CarouselOptions(
// onPageChanged: (index, reason) {
// setState(() {
// _currentPage= index;
// });
// },
// enlargeCenterPage: true,
// autoPlay: true,
// autoPlayInterval: Duration(seconds: 3),
// height: 200,
//
// ),
//
// ),
// ),
// SizedBox(
// height: 15,
//
// ),
// DotsIndicator(
// dotsCount: imgList.length,
// position: _currentPage,
// decorator: DotsDecorator(
// color: Colors.blueGrey, // Inactive color
// activeColor: primaryColor,
// ),
// ),
