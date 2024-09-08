import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Widgets/profile/pf_settings_sub.dart';
import 'package:lavenda/Views/Widgets/profile/profile_settings_heading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/mood.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(Icons.settings, color: Colors.white, size: 20.sp),
              SizedBox(
                width: 10,
              ),
              Text(
                "Settings",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Center(
              child: Container(
                  width: 480,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: Row(
                              children: [
                                CircularProfileAvatar(
                                  '',
                                  backgroundColor: Colors.white,
                                  borderWidth: 1,
                                  borderColor: Colors.black,
                                  elevation: 20,
                                  radius: 20.sp,
                                  cacheImage: true,
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  "Pippa Fitz-Amobi",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.patrickHand(
                                      letterSpacing: 0.5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 5,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ProfileSettingsHeading(header: "Profile Settings"),
                          SizedBox(
                            height: 15,
                          ),
                          PfSettingsSub(title: "Edit Name"),
                          SizedBox(
                            height: 5,
                          ),
                          PfSettingsSub(title: "Journaling Goals"),
                          SizedBox(
                            height: 5,
                          ),
                          PfSettingsSub(
                            title: "Edit Bio",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          PfSettingsSub(
                            title: "Change Password",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            color: Colors.transparent,
                            width: double.infinity,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text("Email Status",
                                      style: GoogleFonts.lato(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Expanded(child: Container()),
                                Row(children: [
                                  Text(
                                    "Not verified",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    FontAwesomeIcons.arrowRight,
                                    size: 14,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    ])));
  }
}
