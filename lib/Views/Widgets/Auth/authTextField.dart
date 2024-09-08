import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Authtextfield extends StatelessWidget {
  final bool obsecureText;
  final TextInputType keyboardType;
  final IconData icon;
  final String labelText;
  final Color labelColor;
  final Color textColor;
  final TextEditingController controller;

  const Authtextfield({
    Key? key,
    required this.obsecureText,
    required this.keyboardType,
    required this.icon,
    required this.labelText,
    required this.labelColor,
    required this.textColor,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.none,
          obscureText: obsecureText,
          autofocus: false,
          keyboardType: keyboardType,
          textAlignVertical:
              TextAlignVertical.center, // Center cursor vertically
          style: GoogleFonts.patrickHand(color: textColor, fontSize: 18.sp),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: textColor,
              size: 15.sp,
            ),
            labelText: labelText,
            labelStyle:
                GoogleFonts.patrickHand(color: labelColor, fontSize: 18.sp),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(
                vertical: 12.sp), // Adjust vertical padding to center cursor
          ),
        ),
      ],
    );
  }
}
