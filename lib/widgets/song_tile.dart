import 'package:flutter/material.dart';
import 'package:reed/constants/colors.dart';
import 'package:reed/utils/size_config.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    Key? key,
    required this.imagePath,
    required this.songName,
    required this.artists,
    required this.isLiked,
  }) : super(key: key);

  final String imagePath;
  final String songName;
  final List<String> artists;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Hero(
            tag: songName,
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/images/dummy_image.jpeg'),
              radius: SizeConfig.widthPercent * 7,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthPercent * 4.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(songName),
                  Text(
                    artists.reduce(
                      (value, element) => value + ', ' + element,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kInactiveIconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              isLiked ? Icons.health_and_safety_rounded : Icons.hearing,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.electric_scooter,
            ),
          )
        ],
      ),
    );
  }
}
