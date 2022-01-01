import 'package:flutter/material.dart';
import 'package:reed/constants/colors.dart';
import 'package:reed/utils/size_config.dart';

class SongInfoNameTile extends StatelessWidget {
  const SongInfoNameTile({
    required this.songName,
    required this.albumName,
    required this.artistName,
    Key? key,
  }) : super(key: key);

  final String songName;
  final String albumName;
  final List<String> artistName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.widthPercent * 70,
              child: Text(
                songName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightPercent * 1,
            ),
            SizedBox(
              width: SizeConfig.widthPercent * 60,
              child: Text(
                albumName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFF451C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightPercent * 1,
            ),
            SizedBox(
              width: SizeConfig.widthPercent * 50,
              child: Text(
                artistName.reduce(
                  (value, element) => value + ', ' + element,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: kInactiveIconColor,
                ),
              ),
            ),
          ],
        ),
        const Icon(
          Icons.hearing_outlined,
        ),
      ],
    );
  }
}
