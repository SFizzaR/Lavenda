import 'package:flutter/material.dart';
import 'package:lavenda/Controller/UserController/user_controller.dart';
import 'package:lavenda/Interfaces/Auth/register_services.dart';
import 'package:lavenda/Views/Profile/profile_setup.dart';

import 'package:lavenda/Views/Widgets/Auth/image_animation.dart';
import 'package:lavenda/Views/Widgets/Auth/authTextField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:lavenda/Views/Auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<String> images = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
    'assets/7.png'
  ];
  final int frameDuration = 500;

  final RegisterServices registerServices = RegisterServices();

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
                  height: 480,
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
                              top: 35.0), // Adjust the top padding here
                          child: Text(
                            "Register",
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
                              Authtextfield(
                                obsecureText: false,
                                keyboardType: TextInputType.emailAddress,
                                icon: Icons.alternate_email,
                                labelText: "Email",
                                labelColor: Color.fromARGB(255, 133, 110, 218),
                                textColor: Colors.white60,
                                controller: RegisterServices().emailController,
                              ),
                              SizedBox(height: 30),
                              Authtextfield(
                                obsecureText: true,
                                keyboardType: TextInputType.text,
                                icon: Icons.lock,
                                labelText: "Password",
                                labelColor: Color.fromARGB(255, 133, 110, 218),
                                textColor: Colors.white60,
                                controller:
                                    RegisterServices().passwordController,
                              ),
                              SizedBox(height: 30),
                              Authtextfield(
                                obsecureText: true,
                                keyboardType: TextInputType.text,
                                icon: Icons.lock_reset,
                                labelText: "Confirm Password",
                                labelColor: Color.fromARGB(255, 133, 110, 218),
                                textColor: Colors.white60,
                                controller: RegisterServices()
                                    .confirmPasswordController,
                              ),
                              SizedBox(height: 30),
                              Hero(
                                tag: "Auth",
                                child: SizedBox(
                                  width: double
                                      .infinity, // Make the button take full width
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (registerServices
                                              .passwordController.text ==
                                          registerServices
                                              .confirmPasswordController.text) {
                                        UserController().registerUser(
                                            registerServices
                                                .emailController.text,
                                            registerServices
                                                .passwordController.text);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileSetup(),
                                          ),
                                        );
                                        print("registered");
                                      } else {
                                        print("passwords donot match ");
                                      }
                                    },
                                    child: Text("Register",
                                        style: GoogleFonts.patrickHand(
                                            color: Colors.white60,
                                            fontSize: 18)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "By registering you agree to our terms and conditions",
                                      style: GoogleFonts.patrickHand(
                                          fontSize: 12,
                                          color: Colors.white60))),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already Registered? ",
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
                                        child: Text("Sign in",
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
