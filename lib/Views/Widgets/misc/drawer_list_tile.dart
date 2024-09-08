import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const DrawerListTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: GoogleFonts.patrickHand(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ))
      ],
    );
  }
}
