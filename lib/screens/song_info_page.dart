import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reed/models/song.dart';
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

  final Song songData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Now Playing'),
        actions: [
          const Icon(Icons.screen_share),
          SizedBox(
            width: SizeConfig.widthPercent * 5,
          ),
          const Icon(Icons.star_border),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthPercent * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: songData.name,
              child: Container(
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
            ),
            SongInfoNameTile(
              songName: songData.name,
              albumName: songData.album,
              artistName: songData.artists,
            ),
            const SongPositionPainter(),
            const SongControlsHud(),
          ],
        ),
      ),
    );
  }
}
