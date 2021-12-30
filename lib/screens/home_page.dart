import 'package:flutter/material.dart';
import 'package:reed/screens/song_info_page.dart';
import 'package:reed/utils/size_config.dart';
import 'package:reed/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: PageView(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.widthPercent * 5),
            child: const SongInfoPage(songData: {}),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
