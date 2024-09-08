import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Profile/profile_settings.dart';
import 'package:lavenda/Views/Widgets/profile/info_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 162, 130, 218), // Start color
              const Color.fromARGB(255, 202, 120, 216), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "My Profile",
              style: GoogleFonts.lato(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(children: [
              CircularProfileAvatar(
                "",
                backgroundColor: Colors.white,
                borderWidth: 1,
                borderColor: Colors.black,
                elevation: 20,
                radius: 60,
                cacheImage: true,
                errorWidget: (context, url, error) {
                  return Icon(
                    Icons.face,
                    size: 50,
                  );
                },
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding:
                      EdgeInsets.all(2), // Adjust padding for better overlap
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.black,
                      size: 16,
                    ),
                    onPressed: () {
                      print("add image");
                    },
                  ),
                ),
              ),
            ]),
            Text(
              "Pippa Fitz-Amobi",
              style: GoogleFonts.patrickHand(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Text(
              "@sarge_pip",
              style: GoogleFonts.patrickHand(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileSettings(),
                    ));
              },
              child: Text(
                "Edit profile",
                style: GoogleFonts.lato(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.deepPurple, width: 1)),
            ),
            SizedBox(
              height: 10,
            ),
            InfoCard(
              type: "Email",
              val: "pippafitz_amobi@gmail.com",
            ),
            InfoCard(
                type: "Journaling Goals",
                val:
                    "Journal about my progress toward my long-term goals every week"),
            InfoCard(type: "Bio", val: "Crime Addict"),
          ],
        )));
  }
}
