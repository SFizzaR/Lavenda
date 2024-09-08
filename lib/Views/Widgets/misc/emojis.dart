import 'package:flutter/material.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Emojis extends StatefulWidget {
  final String moodText;
  final AnimatedEmojiData emoji;

  const Emojis({super.key, required this.moodText, required this.emoji});

  @override
  State<Emojis> createState() => _EmojisState();
}

class _EmojisState extends State<Emojis> {
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print(widget.moodText);
          _returnMood(widget.emoji);
        },
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              _scaleFactor = 1.1;
            });
          },
          onExit: (event) {
            setState(() {
              _scaleFactor = 1.0; // Set this back to 1.0 instead of 1.1 on exit
            });
          },
          child: AnimatedScale(
            scale: _scaleFactor,
            duration: Duration(milliseconds: 200),
            child: Container(
              width: 40.sp,
              height: 40.sp,
              decoration: BoxDecoration(
                color: Color.fromARGB(174, 179, 157, 219),
                shape: BoxShape.circle, // Makes the container round
              ),
              child: Stack(
                alignment: Alignment
                    .center, // Center align the content inside the container
                children: [
                  AnimatedEmoji(
                    widget.emoji,
                    size: 36.sp, // Adjust size to fit well within the container
                  ),
                  Positioned(
                    bottom: 10.sp, // Adjust position as needed
                    child: Text(
                      widget.moodText,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _returnMood(AnimatedEmojiData mood) {
    Navigator.pop(context, mood);
  }
}
