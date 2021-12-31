import 'package:flutter/material.dart';
import 'package:reed/utils/size_config.dart';

class SongControlsHud extends StatelessWidget {
  const SongControlsHud({
    required this.isPlaying,
    required this.isSuffled,
    Key? key,
  }) : super(key: key);

  final bool isPlaying;
  final bool isSuffled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          flex: 5,
          child: Icon(
            Icons.arrow_drop_down_circle_outlined,
          ),
        ),
        const Expanded(
          flex: 3,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        Container(
          width: SizeConfig.widthPercent * 16,
          height: SizeConfig.widthPercent * 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(150),
                blurRadius: 12,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: SizeConfig.widthPercent * 8,
              color: Colors.black,
            ),
          ),
        ),
        const Expanded(
          flex: 3,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
        ),
        Expanded(
          flex: 5,
          child: Icon(
            isSuffled ? Icons.shuffle_on_rounded : Icons.shuffle,
          ),
        ),
      ],
    );
  }
}
