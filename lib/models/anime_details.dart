import 'package:flutter/foundation.dart';

import '/models/anime_node.dart';

class AnimeDetails {
  final int id;
  final String title;
  final MainPicture mainPicture;
  final AlternativeTitles alternativeTitles;
  final String startDate;
  final String endDate;
  final String synopsis;
  final double mean;
  final int rank;
  final int popularity;
  final int numListUsers;
  final int numScoringUsers;
  final String nsfw;
  final String createdAt;
  final String updatedAt;
  final String mediaType;
  final String status;
  final List<Genre> genres;
  final int numEpisodes;
  final StartSeason startSeason;
  // final Broadcast broadcast; // Movie Animes don't support broadcast. (Also the upcoming animes)
  final String source;
  final int averageEpisodeDuration;
  final String rating;
  final List<Picture> pictures;
  final String background;
  final List<RelatedAnime> relatedAnime;
  final List<dynamic> relatedManga;
  final List<Recommendation> recommendations;
  final List<Studio> studios;
  final Statistics statistics;

  AnimeDetails({
    required this.id,
    required this.title,
    required this.mainPicture,
    required this.alternativeTitles,
    required this.startDate,
    required this.endDate,
    required this.synopsis,
    required this.mean,
    required this.rank,
    required this.popularity,
    required this.numListUsers,
    required this.numScoringUsers,
    required this.nsfw,
    required this.createdAt,
    required this.updatedAt,
    required this.mediaType,
    required this.status,
    required this.genres,
    required this.numEpisodes,
    required this.startSeason,
    // required this.broadcast,
    required this.source,
    required this.averageEpisodeDuration,
    required this.rating,
    required this.pictures,
    required this.background,
    required this.relatedAnime,
    required this.recommendations,
    required this.studios,
    required this.statistics,
    required this.relatedManga,
  });

  factory AnimeDetails.fromJson(Map<String, dynamic> json) {
    return AnimeDetails(
      id: json['id'],
      title: json['title'],
      mainPicture: MainPicture.fromJson(json['main_picture']),
      alternativeTitles: AlternativeTitles.fromJson(json['alternative_titles']),
      startDate: json['start_date'] ?? 'Unknown',
      endDate: json['end_date'] ?? 'Unknown',
      synopsis: json['synopsis'],
      mean: json['mean'] ?? 0.0,
      rank: json['rank'] ?? 0,
      popularity: json['popularity'],
      numListUsers: json['num_list_users'],
      numScoringUsers: json['num_scoring_users'],
      nsfw: json['nsfw'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      mediaType: json['media_type'],
      status: json['status'],
      genres: List<Genre>.from(
        json['genres'].map(
          (genre) => Genre.fromJson(genre),
        ),
      ),
      numEpisodes: json['num_episodes'],
      startSeason: json['start_season'] != null
          ? StartSeason.fromJson(json['start_season'])
          : const StartSeason(
              year: 2000,
              season: 'Unknown',
            ),
      // broadcast: Broadcast.fromJson(json['broadcast']),
      source: json['source'],
      averageEpisodeDuration: json['average_episode_duration'],
      rating: json['rating'],
      pictures: List<Picture>.from(
        json['pictures'].map(
          (picture) => Picture.fromJson(picture),
        ),
      ),
      background: json['background'],
      relatedAnime: List<RelatedAnime>.from(
        json['related_anime'].map(
          (anime) => RelatedAnime.fromJson(anime),
        ),
      ),
      relatedManga: json['related_manga'],
      recommendations: List<Recommendation>.from(
        json['recommendations'].map(
          (rec) => Recommendation.fromJson(rec),
        ),
      ),
      studios: List<Studio>.from(
        json['studios'].map(
          (studio) => Studio.fromJson(studio),
        ),
      ),
      statistics: Statistics.fromJson(
        json['statistics'],
      ),
    );
  }
}

@immutable
class MainPicture {
  final String medium;
  final String large;

  const MainPicture({
    required this.medium,
    required this.large,
  });

  factory MainPicture.fromJson(Map<String, dynamic> json) {
    return MainPicture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class AlternativeTitles {
  List<String> synonyms;
  String en;
  String ja;

  AlternativeTitles(
      {required this.synonyms, required this.en, required this.ja});

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) {
    return AlternativeTitles(
      synonyms: List<String>.from(json['synonyms']),
      en: json['en'],
      ja: json['ja'],
    );
  }
}

class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

@immutable
class StartSeason {
  final int year;
  final String season;

  const StartSeason({
    required this.year,
    required this.season,
  });

  factory StartSeason.fromJson(Map<String, dynamic> json) {
    return StartSeason(
      year: json['year'],
      season: json['season'],
    );
  }
}

class Broadcast {
  String dayOfWeek;
  String startTime;

  Broadcast({required this.dayOfWeek, required this.startTime});

  factory Broadcast.fromJson(Map<String, dynamic> json) {
    return Broadcast(
      dayOfWeek: json['day_of_the_week'],
      startTime: json['start_time'],
    );
  }
}

class Picture {
  String medium;
  String large;

  Picture({
    required this.medium,
    required this.large,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class RelatedAnime {
  AnimeNode node;
  String relationType;
  String relationTypeFormatted;

  RelatedAnime({
    required this.node,
    required this.relationType,
    required this.relationTypeFormatted,
  });

  factory RelatedAnime.fromJson(Map<String, dynamic> json) {
    return RelatedAnime(
      node: AnimeNode.fromJson(json['node']),
      relationType: json['relation_type'],
      relationTypeFormatted: json['relation_type_formatted'],
    );
  }
}

class RelatedManga {
  AnimeNode node;
  String relationType;
  String relationTypeFormatted;

  RelatedManga({
    required this.node,
    required this.relationType,
    required this.relationTypeFormatted,
  });

  factory RelatedManga.fromJson(Map<String, dynamic> json) {
    return RelatedManga(
      node: AnimeNode.fromJson(json['node']),
      relationType: json['relation_type'],
      relationTypeFormatted: json['relation_type_formatted'],
    );
  }
}

class Recommendation {
  AnimeNode node;
  int numRecommendations;

  Recommendation({required this.node, required this.numRecommendations});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      node: AnimeNode.fromJson(json['node']),
      numRecommendations: json['num_recommendations'],
    );
  }
}

class Studio {
  int id;
  String name;

  Studio({required this.id, required this.name});

  factory Studio.fromJson(Map<String, dynamic> json) {
    return Studio(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Statistics {
  Status status;
  int numListUsers;

  Statistics({required this.status, required this.numListUsers});

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      status: Status.fromJson(json['status']),
      numListUsers: json['num_list_users'],
    );
  }
}

class Status {
  /// These stats usually come at the form of String but as
  /// there are some animes which get these stats as int,
  /// I decided to tell that they're dynamics and can
  /// come at any form.
  dynamic watching;
  dynamic completed;
  dynamic onHold;
  dynamic dropped;
  dynamic planToWatch;

  Status({
    required this.watching,
    required this.completed,
    required this.onHold,
    required this.dropped,
    required this.planToWatch,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      watching: json['watching'],
      completed: json['completed'],
      onHold: json['on_hold'],
      dropped: json['dropped'],
      planToWatch: json['plan_to_watch'],
    );
  }
}
