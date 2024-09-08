import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Widgets/Auth/authTextField.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlissfulBundle extends StatefulWidget {
  const BlissfulBundle({super.key});

  @override
  State<BlissfulBundle> createState() => _BlissfulBundleState();
}

class _BlissfulBundleState extends State<BlissfulBundle> {
  List<Widget> _textFields = [];

  @override
  void initState() {
    super.initState();
    // Adding the initial 3 text fields
    for (int i = 0; i < 3; i++) {
      _addTextField();
    }
  }

  Widget _buildTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h), // Responsive padding
      child: Container(
        width: 70.w, // Set a fixed width for all text fields
        child: Authtextfield(
          obsecureText: false,
          keyboardType: TextInputType.text,
          icon: FontAwesomeIcons.star,
          labelText: "Thankful For",
          labelColor: Colors.white60,
          textColor: Colors.white,
          controller: TextEditingController(),
        ),
      ),
    );
  }

  void _addTextField() {
    setState(() {
      _textFields.add(_buildTextField());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 162, 130, 218), // Start color
                  Color.fromARGB(255, 202, 120, 216), // End color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Column(
                  children: [
                    SizedBox(height: 5.h), // Add space at the top
                    Text(
                      "Welcome to Blissful Bundle",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Cultivate gratitude with at least 3 daily thankful thoughts.",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ..._textFields, // Display all the text fields
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButton(
                      onPressed: _addTextField,
                      child: Text(
                        "Add more",
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 2.h), // Add space at the bottom
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
