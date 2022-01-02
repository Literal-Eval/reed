class Song {
  Song({
    required this.name,
    required this.album,
    required this.artists,
    required this.path,
  });

  final String name;
  final String album;
  final List<String> artists;

  final String path;
}
