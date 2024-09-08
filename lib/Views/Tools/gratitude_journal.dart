import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Tools/blissful_bundle.dart';
import 'package:lavenda/Views/Widgets/misc/drawer_list_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GratitudeJournal extends StatefulWidget {
  const GratitudeJournal({super.key});
  @override
  _GratitudeJournalState createState() => _GratitudeJournalState();
}

class _GratitudeJournalState extends State<GratitudeJournal> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  void _navigateToPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56), // AppBar height
          child: AppBar(
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/h1.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(
                      0.5), // Optional overlay for text readability
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              'Lavenda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  print("saved");
                },
                icon: Icon(Icons.save),
                color: Colors.white,
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.deepPurple[200],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Column(children: [
                Text('Gratitude Journal',
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 13),
                  child: Text(
                    "Cultivate positivity by recording at least 3 daily things you're thankful for, saving cherished moments, and storing inspiring links in one reflective space.",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 13,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ])),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: DrawerListTile(
                    icon: Icons.arrow_back,
                    text: "Return to Dashboard",
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _navigateToPage(0);
                  },
                  child: DrawerListTile(
                    icon: Icons.auto_awesome,
                    text: "Blissful Bundle",
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _navigateToPage(1);
                  },
                  child: DrawerListTile(
                    icon: FontAwesomeIcons.cameraRetro,
                    text: "Capturing Moments",
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _navigateToPage(2);
                  },
                  child: DrawerListTile(
                    icon: FontAwesomeIcons.link,
                    text: "Joy Links",
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _navigateToPage(3);
                  },
                  child: DrawerListTile(
                    icon: Icons.history,
                    text: "Previous Entries",
                  )),
            ],
          ),
        ),
        body: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            children: [
              BlissfulBundle(),
              Container(
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
              ),
              Container(
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 162, 130, 218), // Start color
                    Color.fromARGB(255, 202, 120, 216), // End color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )),
            ]));
  }
}
