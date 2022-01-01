import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reed/screens/home_page.dart';
import 'package:reed/utils/size_config.dart';
import 'package:reed/widgets/song_controls_hud.dart';
import 'package:reed/widgets/song_info_name_tile.dart';
import 'package:reed/widgets/song_position_painter.dart';

final isPlayingProvider = StateProvider<bool>((ref) {
  return false;
});

final isSuffledProvider = StateProvider<bool>((ref) {
  return false;
});

class SongInfoPage extends StatelessWidget {
  const SongInfoPage({
    required this.songData,
    Key? key,
  }) : super(key: key);

  final Map<String, String> songData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: SizeConfig.widthPercent * 60,
          height: SizeConfig.widthPercent * 60,
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.heightPercent * 3,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                50,
              ),
            ),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/dummy_image.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SongInfoNameTile(
          songName: 'Mr. Tambourine Man',
          albumName: 'Bringing It All Back Home',
          artistName: ['Bob Dylan'],
        ),
        const SongPositionPainter(),
        const SongControlsHud(),
      ],
    );
  }
}
