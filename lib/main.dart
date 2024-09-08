import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavenda/Views/Auth/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Lavenda());
}

class Lavenda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, Orientation, ScreenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: GridPainter(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 85.w, // Using responsive width
                  height: 50.h, // Using responsive height
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/tape.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Center(
                        child: Text(
                          "Lavenda",
                          style: GoogleFonts.kranky(
                            fontSize: 30.sp, // Using responsive text size
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC4E4D7), // Main text color
                            shadows: [
                              Shadow(
                                offset: Offset(-2, -2),
                                color: Color.fromARGB(255, 39, 80, 63),
                              ),
                              Shadow(
                                offset: Offset(2, -2),
                                color: Color.fromARGB(255, 39, 80, 63),
                              ),
                              Shadow(
                                offset: Offset(2, 2),
                                color: Color.fromARGB(255, 39, 80, 63),
                              ),
                              Shadow(
                                offset: Offset(-2, 2),
                                color: Color.fromARGB(255, 39, 80, 63),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Color.fromARGB(255, 12, 65, 24),
                                  width: 4,
                                ),
                                bottom: BorderSide(
                                  color: Color.fromARGB(255, 12, 65, 24),
                                  width: 4,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Builder(
                              builder: (context) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 191, 240, 213),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    print("Button Pressed!"); // Debug statement
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Start Journaling',
                                    style: GoogleFonts.patrickHand(
                                      color: Color.fromARGB(255, 12, 65, 24),
                                      fontWeight: FontWeight.w200,
                                      fontSize:
                                          20.sp, // Using responsive text size
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5.h, // Using responsive position
                        right: -13.w, // Using responsive position
                        child: Image.asset(
                          'assets/lavender.png',
                          width: 50.w, // Using responsive size
                          height: 25.h, // Using responsive size
                          scale: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double gridSize = 50; // Size of each grid square
    Paint paint = Paint()
      ..color = Color(0xFFC4E4D7)
      ..strokeWidth = 1;

    for (double i = 0; i <= size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i <= size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
