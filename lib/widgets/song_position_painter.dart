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
    final lineWidth = SizeConfig.widthPercent * 1;
    final paint = Paint()
      ..color = kInactiveIconColor
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawPath(CustomPath.getPath(size, currentPosition), paint);
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
    final lineWidth = SizeConfig.widthPercent * 1;
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.clipRect(
      Rect.fromLTWH(0, 0, size.width * (currentPosition / (duration * 1000)),
          size.height),
    );

    canvas.drawPath(CustomPath.getPath(size, currentPosition), paint);
  }

  @override
  bool shouldRepaint(covariant SongPositionForegroundPainter oldDelegate) {
    return oldDelegate.currentPosition != currentPosition;
  }
}

class CustomPath {
  static Path path = Path();
  static int oldTime = 0;

  static Path getPath(Size size, int time) {
    if (time == oldTime) {
      return path;
    }

    oldTime = time;
    final randGen = Random(DateTime.now().millisecondsSinceEpoch);
    path.reset();

    double barHeight = 0;
    double startPos = 0;

    for (double i = 2; i < size.width; i += SizeConfig.widthPercent * 2) {
      barHeight = randGen
              .nextInt((size.height - SizeConfig.heightPercent * 5).toInt()) +
          SizeConfig.heightPercent * 2;
      startPos = size.height / 2 - barHeight / 2;
      path.moveTo(i, startPos);
      path.lineTo(i, startPos + barHeight);
    }

    return path;
  }

  void generatePath() {}
}
