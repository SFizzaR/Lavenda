import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lavenda/Views/Homepage/dashboard.dart';
import 'package:lavenda/Views/Profile/my_profile.dart';
import 'package:lavenda/Views/Tools/calender_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<IconData> IconsList = [
    Icons.person,
    FontAwesomeIcons.home,
    FontAwesomeIcons.calendar,
  ];

  int page = 1;
  PageController pageController = PageController(initialPage: 1);

  Widget pageViewSection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [MyProfile(), Dashboard(), CalenderView()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0), // AppBar height
        child: AppBar(
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/h1.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black
                    .withOpacity(0.5), // Optional overlay for text readability
              ),
              Positioned(
                right: 16, // Position it towards the right edge
                top: 12, // Position it towards the top edge
                child: Container(
                  width: 20.sp, // Set the size of the circle
                  height: 20.sp,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple, // Circle color
                    shape: BoxShape.circle, // Make it a circle
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'Lavenda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: IconsList,
        activeIndex: page,
        onTap: (p0) {
          setState(() {
            page = p0;
            pageController.animateToPage(p0,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.black,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
      ),
      body: pageViewSection(),
    );
  }
}
