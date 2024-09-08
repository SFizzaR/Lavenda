import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSettingsHeading extends StatelessWidget {
  const ProfileSettingsHeading({super.key, required this.header});
  final String header;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        header,
        style: GoogleFonts.lato(
            color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ),
    );
  }
}
