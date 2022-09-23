import 'package:flutter/material.dart';
import 'package:reed/constants/colors.dart';
import 'package:reed/models/song.dart';
import 'package:reed/screens/song_info_page.dart';
import 'package:reed/utils/size_config.dart';
import 'package:reed/widgets/song_tile.dart';

class SongListPage extends StatefulWidget {
  const SongListPage({Key? key}) : super(key: key);

  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  final List<Song> songList = [
    Song(
        name: 'Cheap Thrills',
        album: 'This Is acting',
        artists: ['Sia'],
        path: 'assets/music/file.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: songList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongInfoPage(
                      songData: songList[index],
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  SongTile(
                    songName: songList[index].name,
                    artists: songList[index].artists,
                    imagePath: 'assets/images/dummy_image.jpeg',
                    isLiked: false,
                  ),
                  Divider(
                    color: kInactiveIconColor,
                    indent: SizeConfig.widthPercent * 5,
                    endIndent: SizeConfig.widthPercent * 5,
                    height: SizeConfig.heightPercent * 2,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
