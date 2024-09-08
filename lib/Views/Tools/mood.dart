import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lavenda/Views/Widgets/misc/emojis.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animated_emoji/animated_emoji.dart';

class Mood extends StatefulWidget {
  const Mood({super.key});
  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Text(
                  "Hi, how are you feeling today?",
                  style: GoogleFonts.kranky(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Wrap(
                spacing: 4.w,
                runSpacing: 8.0,
                children: [
                  Emojis(moodText: "Sad", emoji: AnimatedEmojis.sad),
                  Emojis(moodText: "Happy", emoji: AnimatedEmojis.smile),
                  Emojis(
                      moodText: "Anxious",
                      emoji: AnimatedEmojis.anxiousWithSweat),
                  Emojis(moodText: "Angry", emoji: AnimatedEmojis.angry),
                  Emojis(moodText: "Scared", emoji: AnimatedEmojis.scared),
                  Emojis(moodText: "Relieved", emoji: AnimatedEmojis.relieved),
                  Emojis(
                      moodText: "Surprised", emoji: AnimatedEmojis.surprised),
                  Emojis(moodText: "Excited", emoji: AnimatedEmojis.starStruck),
                  Emojis(moodText: "Bored", emoji: AnimatedEmojis.neutralFace),
                  Emojis(moodText: "Tired", emoji: AnimatedEmojis.exhale),
                  Emojis(moodText: "Grateful", emoji: AnimatedEmojis.halo),
                  Emojis(
                      moodText: "Curious", emoji: AnimatedEmojis.thinkingFace),
                  Emojis(moodText: "Worried", emoji: AnimatedEmojis.worried),
                  Emojis(
                      moodText: "Concerned", emoji: AnimatedEmojis.concerned),
                  Emojis(moodText: "Content", emoji: AnimatedEmojis.warmSmile),
                  Emojis(moodText: "Annoyed", emoji: AnimatedEmojis.weary),
                  Emojis(
                      moodText: "Confused", emoji: AnimatedEmojis.faceInClouds),
                  Emojis(moodText: "Joyful", emoji: AnimatedEmojis.grinning),
                  Emojis(moodText: "Awkward", emoji: AnimatedEmojis.grimacing),
                  Emojis(
                      moodText: "Embarrassed", emoji: AnimatedEmojis.flushed),
                  Emojis(
                      moodText: "Stressed",
                      emoji: AnimatedEmojis.scrunchedMouth),
                  Emojis(
                      moodText: "Cherished", emoji: AnimatedEmojis.heartFace),
                  Emojis(moodText: "Sleepy", emoji: AnimatedEmojis.sleep),
                  Emojis(
                      moodText: "Confident",
                      emoji: AnimatedEmojis.sunglassesFace),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
