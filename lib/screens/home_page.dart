import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:reed/screens/song_info_page.dart';
import 'package:reed/screens/song_list_page.dart';
import 'package:reed/utils/size_config.dart';
import 'package:reed/widgets/bottom_navigation_bar.dart';

final audioProvider = StateProvider<AudioPlayer>((ref) {
  return AudioPlayer();
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    setupAudio();
  }

  void setupAudio() async {
    await ref.read(audioProvider.state).state.setAsset('assets/music/file.mp3');
    // ref.read(audioProvider.state).state.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('REED'),
      ),
      body: PageView(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.widthPercent * 4),
            // child: const SongInfoPage(songData: {}),
            child: const SongListPage(),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
