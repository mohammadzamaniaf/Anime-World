import 'package:flutter/material.dart';

@immutable
class AnimeCategory {
  final String title;
  final String rankingType;

  const AnimeCategory({
    required this.title,
    required this.rankingType,
  });

  factory AnimeCategory.fromJson(Map<String, dynamic> json) {
    return AnimeCategory(
      title: json['title'],
      rankingType: json['rankingType'],
    );
  }
}

const animeCategories = [
  AnimeCategory(title: 'Top Anime Series', rankingType: 'all'),
  AnimeCategory(title: 'Top Airing Anime', rankingType: 'airing'),
  AnimeCategory(title: 'Top Upcoming Anime', rankingType: 'upcoming'),
  AnimeCategory(title: 'Top Anime TV Series', rankingType: 'tv'),
  AnimeCategory(title: 'Top Anime OVA Series', rankingType: 'ova'),
  AnimeCategory(title: 'Top Anime Movies', rankingType: 'movie'),
  AnimeCategory(title: 'Top Anime Specials', rankingType: 'special'),
  AnimeCategory(title: 'Top Anime by Popularity', rankingType: 'bypopularity'),
  AnimeCategory(title: 'Top Favorited Anime', rankingType: 'favorite'),
];
