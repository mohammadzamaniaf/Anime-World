import 'package:anime_world/models/anime_node.dart';

class AnimeInfo {
  List<AnimeNode> data;

  AnimeInfo({required this.data});

  factory AnimeInfo.fromJson(Map<String, dynamic> json) {
    return AnimeInfo(
      data: List<AnimeNode>.from(
        json['data'].map(
          (animeItem) => AnimeNode.fromJson(
            animeItem['node'],
          ),
        ),
      ),
    );
  }
}
