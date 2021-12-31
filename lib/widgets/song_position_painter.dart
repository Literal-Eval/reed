import 'dart:math';

import 'package:flutter/material.dart';
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
                    ref.watch(audioProvider.state).state.duration?.inSeconds ??
                        1,
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
    return oldDelegate.currentPosition != currentPosition;
  }
}
