import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Interfaces/Auth/login_services.dart';
import 'package:lavenda/Views/Auth/forgot_password.dart';
import 'package:lavenda/Views/Homepage/homepage.dart';
import 'package:lavenda/Views/Widgets/Auth/authTextField.dart';
import 'package:lavenda/Views/Widgets/Auth/image_animation.dart';
import 'package:lavenda/Views/Auth/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png'
  ];
  final int frameDuration = 500; // duration of each frame in milliseconds
  final LoginServices loginServices = LoginServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageAnimation(
            images: images,
            frameDuration: frameDuration,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 35.0), // Adjust the top padding here
                            child: Text(
                              "Login",
                              style: GoogleFonts.lato(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  20), // Add space between title and text fields
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Authtextfield(
                                  obsecureText: false,
                                  keyboardType: TextInputType.emailAddress,
                                  icon: Icons.alternate_email,
                                  labelText: "Email",
                                  labelColor:
                                      Color.fromARGB(255, 133, 110, 218),
                                  textColor: Colors.white60,
                                  controller: LoginServices().emailController,
                                ),
                                SizedBox(height: 30),
                                Authtextfield(
                                  obsecureText: true,
                                  keyboardType: TextInputType.text,
                                  icon: Icons.lock,
                                  labelText: "Password",
                                  labelColor:
                                      Color.fromARGB(255, 133, 110, 218),
                                  textColor: Colors.white60,
                                  controller:
                                      LoginServices().passwordController,
                                ),
                                SizedBox(height: 30),
                                Hero(
                                  tag: "Auth",
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Homepage(),
                                          ),
                                        );
                                        print("login");
                                      },
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.patrickHand(
                                          color: Colors.white60,
                                          fontSize: 18,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Hero(
                                  tag: "Auth",
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Forgot password?",
                                        style: GoogleFonts.patrickHand(
                                          fontSize: 12,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: GoogleFonts.patrickHand(
                                        fontSize: 15,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    Hero(
                                      tag: "Auth",
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Register(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Sign up",
                                          style: GoogleFonts.patrickHand(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height:
                                        20), // Add space at the bottom to avoid white space
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
