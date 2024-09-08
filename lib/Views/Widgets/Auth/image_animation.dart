import 'package:flutter/material.dart';

class ImageAnimation extends StatefulWidget {
  final List<String> images;
  final int frameDuration;

  const ImageAnimation({
    Key? key,
    required this.images,
    this.frameDuration = 500,
  }) : super(key: key);

  @override
  _ImageAnimationState createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentFrame = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(milliseconds: widget.frameDuration * widget.images.length),
    )
      ..addListener(() {
        setState(() {
          _currentFrame = (_controller.value * widget.images.length).floor() %
              widget.images.length;
        });
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        widget.images[_currentFrame],
        fit: BoxFit.cover,
      ),
    );
  }
}
