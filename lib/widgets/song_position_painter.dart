import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reed/utils/size_config.dart';

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
        CustomPaint(
          painter: SongPositionBackgroundPainter(
            duration: 50,
          ),
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.heightPercent * 10,
          ),
          foregroundPainter: SongPositionForegroundPainter(
            duration: 50,
            currentPosition: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final randGen = Random(DateTime.now().millisecondsSinceEpoch);

    path.moveTo(0, size.height / 2);

    for (int i = 0; i < size.width - 20; i += 20) {
      path.quadraticBezierTo(
        i + 10,
        (i % 40) == 0
            ? randGen.nextInt(size.height ~/ 2).toDouble()
            : randGen.nextInt(size.height ~/ 2) + size.height / 2,
        (i + 20).toDouble(),
        size.height / 2,
      );
    }

    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SongPositionBackgroundPainter oldDelegate) {
    return oldDelegate.duration != duration;
  }
}

class SongPositionForegroundPainter extends CustomPainter {
  SongPositionForegroundPainter({
    required this.duration,
    required this.currentPosition,
  });

  final int duration;
  final int currentPosition;

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant SongPositionForegroundPainter oldDelegate) {
    return true;
  }
}
