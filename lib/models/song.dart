import 'package:hive/hive.dart';

part 'song.g.dart';

@HiveType(typeId: 0)
class Song {
  Song({
    required this.name,
    required this.album,
    required this.artists,
    required this.path,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String album;

  @HiveField(2)
  final List<String> artists;

  @HiveField(3)
  final String path;
}
