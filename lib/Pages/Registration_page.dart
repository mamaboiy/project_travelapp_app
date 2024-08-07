import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_travelapp_app/List/LoginList.dart';
import 'package:project_travelapp_app/Pages/Login_page.dart';
import 'package:project_travelapp_app/constant/constant.dart';
import 'package:project_travelapp_app/models/loignModel.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  bool isObsPassword = true;
  bool isObsRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
              key: _formKey,
              child: Column(
                children: [
                  /// First Name
                  Container(
                    width: 350,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              label: Text('First Name', style: myStyle(17, Colors.black, FontWeight.bold),),
                              hintText: 'First Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                        ),
                        Gap(20),

                        /// Last Name
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              label: Text('Last Name', style: myStyle(17, Colors.black, FontWeight.bold),),
                              hintText: 'Last Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                        Gap(20),

                        /// Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              label: Text('Email', style: myStyle(17, Colors.black, FontWeight.bold),),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            if (!value.contains('@')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                        Gap(20),

                        /// Password
                        TextFormField(
                          controller: _passwordController,
                          obscureText: isObsPassword,
                          decoration: InputDecoration(
                            label: Text('Password', style: myStyle(17, Colors.black, FontWeight.bold)),
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObsPassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObsPassword = !isObsPassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            if (value.length < 8) {
                              return 'Password must contain at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        Gap(20),

                        /// Re-password
                        TextFormField(
                          controller: _rePasswordController,
                          obscureText: isObsRePassword,
                          decoration: InputDecoration(
                            label: Text('Re-password', style: myStyle(17, Colors.black, FontWeight.bold)),
                            hintText: 'Re-password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObsRePassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObsRePassword = !isObsRePassword;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please re-enter your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
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
                      'Sign Up',
                      style: myStyle(25, Colors.white, FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final registrationSnackbar = SnackBar(
                          content: Text('Signup Successful'),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(registrationSnackbar);
                        login.add(LoginModel(
                          firstname: _firstNameController.text,
                          secondname: _lastNameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        ));
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => hotel_registration()),
                              (route) => false,
                        );
                      }
                    },
                  ),
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
                            Text('Already have an account?', style: myStyle(19, Colors.black),),
                            Text(' Log In!', style: myStyle(19, Colors.indigoAccent, FontWeight.bold),),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => hotel_registration()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
                      image: AssetImage('assets/images/google.webp'),
                    ),
                  ),
                ),
                SizedBox(width: 50,),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/facebook.webp'),
                    ),
                  ),
                ),
              ],
            ),
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
