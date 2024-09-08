import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Tools/gratitude_journal.dart';
import 'package:lavenda/Views/Tools/journal.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  double _journalimageScale = 1.0;
  double _gratitudeimageScale = 1.0;

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
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Hi Pippa, ready to reflect?",
                    style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                        fontStyle: FontStyle.italic),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                print("journal");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Journal()));
                              },
                              child: MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _journalimageScale = 1.1;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _journalimageScale = 1.0;
                                  });
                                },
                                child: AnimatedScale(
                                  scale: _journalimageScale,
                                  duration: Duration(milliseconds: 200),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/journal.png',
                                        height: 40.h,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(height: 1.h),
                                      Wrap(children: [
                                        Text(
                                          "Where thoughts flow freely, and stories unfold",
                                          softWrap: true,
                                          style: GoogleFonts.lato(
                                              fontSize: 17.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                          textAlign: TextAlign.center,
                                        )
                                      ])
                                    ],
                                  ),
                                ),
                              ))),
                      SizedBox(width: 4.w),
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                print("gratitude");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GratitudeJournal()));
                              },
                              child: MouseRegion(
                                  onEnter: (_) {
                                    setState(() {
                                      _gratitudeimageScale = 1.05;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      _gratitudeimageScale = 1.0;
                                    });
                                  },
                                  child: AnimatedScale(
                                    scale: _gratitudeimageScale,
                                    duration: Duration(milliseconds: 200),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/gratitude.png',
                                          height: 40.h,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(height: 1.h),
                                        Text(
                                          "Cultivating joy, one thankful thought at a time",
                                          style: GoogleFonts.lato(
                                              fontSize: 17.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )))),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
