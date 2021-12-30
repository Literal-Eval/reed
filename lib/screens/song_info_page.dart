import 'package:flutter/material.dart';
import 'package:reed/utils/size_config.dart';
import 'package:reed/widgets/song_info_name_tile.dart';

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
            // border: Border.all(
            //   width: 5,
            //   color: Colors.white,
            // ),
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
          songName: 'Mr. Tamburine Man',
          albumName: 'Henlo boi',
          artistName: [
            'Yesh Man',
            'Henlo Man',
            'Go Away',
          ],
        ),
      ],
    );
  }
}
