import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.type,
    required this.val,
  });

  final String type;
  final String val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Stack(
        clipBehavior: Clip.none, // Ensure that the text doesn't get clipped
        children: [
          Column(
            children: [
              SizedBox(height: 3.h), // Increased space above the container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple),
                  color: Colors.white,
                ),
                height: 7.h,
                width: 70.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      val,
                      style: GoogleFonts.lato(
                        color: val == "Not Currently Set"
                            ? Colors.red
                            : Colors.deepPurple,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: -2.1.h, // Adjusted position for better visibility
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                type,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
