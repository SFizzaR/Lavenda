import 'package:flutter/material.dart';
import 'package:lavenda/Interfaces/Auth/forgot_password_services.dart';
import 'package:lavenda/Views/Widgets/Auth/image_animation.dart';
import 'package:lavenda/Views/Widgets/Auth/authTextField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:lavenda/Views/Auth/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
  final ForgotPasswordServices forgotPasswordServices =
      ForgotPasswordServices();
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0), // Adjust the top padding here
                          child: Text(
                            "Forgot Password",
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
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Text(
                                  "Please enter the email address associated with your account. We will send you a link to reset your password.",
                                  style: GoogleFonts.patrickHand(
                                      color: Colors.white60, fontSize: 12)),
                              SizedBox(
                                height: 10,
                              ),
                              Authtextfield(
                                obsecureText: false,
                                keyboardType: TextInputType.emailAddress,
                                icon: Icons.alternate_email,
                                labelText: "Email",
                                labelColor: Color.fromARGB(255, 133, 110, 218),
                                textColor: Colors.white60,
                                controller:
                                    ForgotPasswordServices().emailController,
                              ),
                              SizedBox(height: 30),
                              SizedBox(
                                width: double
                                    .infinity, // Make the button take full width
                                child: ElevatedButton(
                                  onPressed: () {
                                    print("submit");
                                  },
                                  child: Text("Submit",
                                      style: GoogleFonts.patrickHand(
                                          color: Colors.white60, fontSize: 18)),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple,
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10)),
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Back to ",
                                      style: GoogleFonts.patrickHand(
                                          fontSize: 15, color: Colors.white60)),
                                  Hero(
                                      tag: "Auth",
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()),
                                          );
                                        },
                                        child: Text("Login",
                                            style: GoogleFonts.patrickHand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60)),
                                      ))
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
            ),
          )
        ],
      ),
    );
  }
}
