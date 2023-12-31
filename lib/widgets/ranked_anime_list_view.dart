import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/models/ranking_anime.dart';
import '/widgets/anime_list_tile.dart';

class RankedAnimeListView extends StatelessWidget {
  const RankedAnimeListView({
    super.key,
    required this.animes,
    required this.label,
  });

  final Iterable<AnimeRankingItem> animes;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Padding(
        padding: Constants.defaultPadding,
        child: ListView.builder(
          itemCount: animes.length,
          itemBuilder: (context, index) {
            final anime = animes.elementAt(index);
            return AnimeListTile(
              anime: anime.node,
              rank: anime.ranking.rank,
            );
          },
        ),
      ),
    );
  }
}
