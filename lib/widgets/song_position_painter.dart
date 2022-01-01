import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reed/constants/colors.dart';
import 'package:reed/screens/home_page.dart';
import 'package:reed/utils/size_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongPositionPainter extends ConsumerStatefulWidget {
  const SongPositionPainter({
    Key? key,
  }) : super(key: key);

  @override
  _SongPositionPainterState createState() => _SongPositionPainterState();
}

class _SongPositionPainterState extends ConsumerState<SongPositionPainter> {
  String parseSeconds(int seconds) {
    if (seconds ~/ 3600 == 0) {
      return '${padInt(seconds ~/ 60)}:${padInt(seconds % 60)}';
    } else {
      return '${seconds ~/ 3600}:${padInt(seconds ~/ 60)}:${padInt(seconds % 60)}';
    }
  }

  String padInt(int num) {
    return (num < 9) ? '0$num' : '$num';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: ref.watch(audioProvider.state).state.positionStream,
      builder: (context, snapshot) {
        return Column(
          children: [
            CustomPaint(
              painter: SongPositionBackgroundPainter(
                duration:
                    ref.read(audioProvider.state).state.duration?.inSeconds ??
                        1,
                currentPosition: snapshot.data?.inMilliseconds ?? 0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.heightPercent * 10,
              ),
              foregroundPainter: SongPositionForegroundPainter(
                duration:
                    ref.watch(audioProvider.state).state.duration?.inSeconds ??
                        1,
                currentPosition: snapshot.data?.inMilliseconds ?? 0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  parseSeconds(snapshot.data?.inSeconds ?? 0),
                ),
                Text(
                  parseSeconds(ref
                          .watch(audioProvider.state)
                          .state
                          .duration
                          ?.inSeconds ??
                      0),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class SongPositionBackgroundPainter extends CustomPainter {
  SongPositionBackgroundPainter({
    required this.duration,
    required this.currentPosition,
  });

  final int duration;
  final int currentPosition;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(
        0,
        15,
        size.width,
        size.height - 30,
      ),
      Paint()
        ..style = PaintingStyle.fill
        ..color = kInactiveIconColor,
    );

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        15,
        (currentPosition / (duration * 1000)) * size.width,
        size.height - 30,
      ),
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.red,
    );
  }

  @override
  bool shouldRepaint(covariant SongPositionBackgroundPainter oldDelegate) {
    return oldDelegate.currentPosition != currentPosition;
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
  void paint(Canvas canvas, Size size) {
    final upperPath = Path();
    final randGen = Random(DateTime.now().millisecondsSinceEpoch);

    upperPath.moveTo(0, 10);
    upperPath.lineTo(0, size.height / 2);

    for (int i = 0; i < size.width - 40; i += 20) {
      upperPath.quadraticBezierTo(
        i + 10,
        randGen.nextInt(size.height ~/ 2 - 20).toDouble() + 20,
        i + 20,
        randGen.nextInt(size.height ~/ 2 - 20).toDouble() + 20,
      );
    }

    upperPath.quadraticBezierTo(
      size.width - 10,
      randGen.nextInt(size.height ~/ 2 - 20).toDouble() + 20,
      size.width,
      size.height / 2,
    );
    upperPath.lineTo(size.width, 10);
    upperPath.lineTo(0, 10);

    final lowerPath = Path();

    lowerPath.moveTo(0, size.height / 2);

    for (int i = 0; i < size.width - 40; i += 20) {
      lowerPath.quadraticBezierTo(
        i + 10,
        size.height / 2 + randGen.nextInt(size.height ~/ 2 - 20).toDouble(),
        i + 20,
        size.height / 2 + randGen.nextInt(size.height ~/ 2 - 20).toDouble(),
      );
    }

    lowerPath.quadraticBezierTo(
      size.width - 10,
      size.height / 2 + randGen.nextInt(size.height ~/ 2 - 20).toDouble(),
      size.width,
      size.height / 2,
    );
    lowerPath.lineTo(size.width, size.height - 10);
    lowerPath.lineTo(0, size.height - 10);

    final paint = Paint()
      ..strokeWidth = 4
      ..color = kBackgroundColor
      ..style = PaintingStyle.stroke;

    // canvas.drawPath(upperPath, paint);
    paint.style = PaintingStyle.fill;
    canvas.drawPath(upperPath, paint);

    // canvas.drawPath(lowerPath, paint);
    paint.style = PaintingStyle.fill;
    canvas.drawPath(lowerPath, paint);
  }

  @override
  bool shouldRepaint(covariant SongPositionForegroundPainter oldDelegate) {
    return oldDelegate.duration != duration;
  }
}
