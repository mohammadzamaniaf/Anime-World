import 'package:flutter/material.dart';

import '/models/anime_node.dart';
import '/constants/constants.dart';
import '/widgets/anime_list_tile.dart';

class AnimeListView extends StatelessWidget {
  const AnimeListView({
    super.key,
    required this.animes,
  });

  final Iterable<AnimeNode> animes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.defaultPadding,
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes.elementAt(index);
          return AnimeListTile(
            anime: anime,
          );
        },
      ),
    );
  }
}
