import 'package:flutter/material.dart';
import 'package:reed/utils/size_config.dart';

class SongControlsHud extends StatelessWidget {
  const SongControlsHud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_drop_down_circle_outlined),
        const Icon(Icons.arrow_back_ios_new_rounded),
        Container(
          width: SizeConfig.widthPercent * 16,
          height: SizeConfig.widthPercent * 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(150),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.pause,
              color: Colors.black,
            ),
          ),
        ),
        const Icon(Icons.arrow_forward_ios_outlined),
        const Icon(Icons.shuffle),
      ],
    );
  }
}
