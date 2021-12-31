import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reed/screens/song_info_page.dart';
import 'package:reed/utils/size_config.dart';

class SongControlsHud extends StatelessWidget {
  const SongControlsHud({
    // this.isPlaying,
    // this.isSuffled,
    Key? key,
  }) : super(key: key);

  // final bool? isPlaying;
  // final bool? isSuffled;

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
            child: Consumer(
              builder: (context, ref, child) {
                bool isPlaying = ref.watch(isPlayingProvider);
                isPlayingProvider.state;
                return GestureDetector(
                  onTap: () {
                    ref.read(isPlayingProvider.state).state = !isPlaying;
                  },
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: SizeConfig.widthPercent * 8,
                    color: Colors.black,
                  ),
                );
              },
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
          child: Consumer(
            builder: (context, ref, child) {
              bool isSuffled = ref.watch(isSuffledProvider);
              return GestureDetector(
                onTap: () {
                  ref.read(isSuffledProvider.state).state = !isSuffled;
                },
                child: Icon(
                  isSuffled ? Icons.shuffle_on_rounded : Icons.shuffle,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
