import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PfSettingsSub extends StatelessWidget {
  final String title;

  PfSettingsSub({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      color: Colors.transparent,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            child: Text(title,
                style: GoogleFonts.lato(
                    color: Colors.black, fontWeight: FontWeight.w500)),
          ),
          Expanded(child: Container()),
          Icon(
            FontAwesomeIcons.arrowRight,
            size: 14,
          ),
        ],
      ),
    );
  }
}
