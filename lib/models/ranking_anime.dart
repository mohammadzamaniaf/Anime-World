import 'package:flutter/foundation.dart' show immutable;

import '/models/anime_node.dart';

@immutable
class AnimeRanking {
  final List<AnimeRankingItem> data;
  final Paging paging;

  const AnimeRanking({
    required this.data,
    required this.paging,
  });

  factory AnimeRanking.fromJson(Map<String, dynamic> json) {
    List<dynamic> animeRankingList = json['data'];
    List<AnimeRankingItem> animeRankingItems = animeRankingList
        .map(
          (item) => AnimeRankingItem.fromJson(item),
        )
        .toList();

    return AnimeRanking(
      data: animeRankingItems,
      paging: Paging.fromJson(json['paging']),
    );
  }
}

@immutable
class AnimeRankingItem {
  final AnimeNode node;
  final Ranking ranking;

  const AnimeRankingItem({
    required this.node,
    required this.ranking,
  });

  factory AnimeRankingItem.fromJson(Map<String, dynamic> json) {
    return AnimeRankingItem(
      node: AnimeNode.fromJson(json['node']),
      ranking: Ranking.fromJson(json['ranking']),
    );
  }
}

@immutable
class Ranking {
  final int rank;

  const Ranking({
    required this.rank,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      rank: json['rank'],
    );
  }
}

@immutable
class Paging {
  final String next;

  const Paging({
    required this.next,
  });

  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      next: json['next'],
    );
  }
}
