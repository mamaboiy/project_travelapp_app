// import 'package:batch_or/Imports.dart';
// import 'package:batch_or/doctor%20page/homePage.dart';
// import 'package:batch_or/hotel_data/login_list.dart';
// import 'package:batch_or/hotel_model/login_model.dart';
// import 'package:batch_or/hotel_page/hotel_page.dart';
// import 'package:batch_or/hotel_page/registeration%20_page.dart';
// import 'package:batch_or/snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_travelapp_app/List/LoginList.dart';
import 'package:project_travelapp_app/Pages/Registration_page.dart';
import 'package:project_travelapp_app/Pages/bottomNavBAr.dart';
import 'package:project_travelapp_app/Pages/home_page.dart';
import 'package:project_travelapp_app/constant/constant.dart';

class hotel_registration extends StatefulWidget {
  const hotel_registration({super.key});

  @override
  State<hotel_registration> createState() => _hotel_registrationState();
}

class _hotel_registrationState extends State<hotel_registration> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isObs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    child: ClipPath(
                      clipper: CustomClipperPath(),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          image: DecorationImage(
                            image: AssetImage('assets/images/login.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      ///email
                      Container(
                        width: 350,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                  label: Text('Email', style: myStyle(17, Colors.black, FontWeight.bold)),
                                  hintText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                            ),
                            Gap(20),

                            ///password
                            TextFormField(
                              controller: _password,
                              obscureText: isObs, // Use isObs to control visibility
                              decoration: InputDecoration(
                                label: Text('Password', style: myStyle(17, Colors.black, FontWeight.bold)),
                                hintText: 'password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isObs ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isObs = !isObs; // Toggle visibility
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must contain at least 8 characters';
                                }
                                return null; // No error
                              },
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          color: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Log In',
                            style: myStyle(25, Colors.white, FontWeight.bold),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate() &&
                                _email.text.toString() == login[0].email &&
                                _password.text.toString() == login[0].password) {
                              final hotel_registration = SnackBar(
                                content: Text('Login Successful'),
                                behavior: SnackBarBehavior.floating,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(hotel_registration);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (builder) =>buttomnavbar()),
                                      (routes) => false);
                            }
                          }),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 150,
                            color: Colors.black,
                          ),
                          Text('OR', style: myStyle(18, Colors.black, FontWeight.bold),),
                          Container(
                            height: 1,
                            width: 150,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                              child: Row(
                                children: [
                                  Text('Don\'t have an account?', style: myStyle(19, Colors.black),),
                                  Text(
                                    'Sign Up!',
                                    style: myStyle(19, Colors.indigoAccent, FontWeight.bold),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (builder) => RegistrationPage()));
                              }),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/google.webp')))),
                SizedBox(width: 50,),
                Container(
                    margin: EdgeInsets.all(20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('assets/images/facebook.webp')))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


