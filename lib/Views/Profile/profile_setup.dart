import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:lavenda/Views/Homepage/homepage.dart';
import 'package:lavenda/Views/Widgets/Auth/authTextField.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/mood.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 350, // Fixed width
                    height: 65.h, // Fixed height
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Stack(children: [
                                CircularProfileAvatar(
                                  '',
                                  child: Icon(
                                    Icons.person,
                                    size: 30.sp,
                                  ),
                                  borderColor: Colors.black,
                                  borderWidth: 3,
                                  elevation: 5,
                                  radius: 75,
                                ),
                              ])),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Transform.translate(
                              offset: Offset(-85, -55), // Adjust position
                              child: Container(
                                padding: EdgeInsets.all(
                                    2), // Adjust padding for better overlap
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    print("add image");
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Authtextfield(
                                  obsecureText: false,
                                  keyboardType: TextInputType.text,
                                  icon: Icons.person_2,
                                  labelText: "Username",
                                  labelColor:
                                      Color.fromARGB(255, 133, 110, 218),
                                  textColor: Colors.deepPurple,
                                  controller: TextEditingController(),
                                ),
                                SizedBox(height: 3),
                                Authtextfield(
                                  obsecureText: true,
                                  keyboardType: TextInputType.text,
                                  icon: Icons.edit,
                                  labelText: "Bio",
                                  labelColor:
                                      Color.fromARGB(255, 133, 110, 218),
                                  textColor: Colors.deepPurple,
                                  controller: TextEditingController(),
                                ),
                                SizedBox(height: 3.h),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 191, 240, 213),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Homepage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Next',
                                      style: GoogleFonts.patrickHand(
                                        color: Color.fromARGB(255, 12, 65, 24),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
