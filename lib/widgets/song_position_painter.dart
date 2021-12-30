import 'package:flutter/material.dart';

class SongPositionPainter extends StatefulWidget {
  const SongPositionPainter({
    required this.duration,
    required this.currentPosition,
    Key? key,
  }) : super(key: key);

  final int duration;
  final int currentPosition;

  @override
  _SongPositionPainterState createState() => _SongPositionPainterState();
}

class _SongPositionPainterState extends State<SongPositionPainter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(),
        Row(
          children: [
            Text(
              widget.currentPosition.toString(),
            ),
            Text(
              widget.duration.toString(),
            ),
          ],
        )
      ],
    );
  }
}

class SongPositionBackgroundPainter extends CustomPainter {
  SongPositionBackgroundPainter({
    required this.duration,
  });

  final int duration;

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant SongPositionBackgroundPainter oldDelegate) {
    return oldDelegate.duration != duration;
  }
}

class SongPositionForegroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
