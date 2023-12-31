import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/constants/constants.dart';
import '/models/ranking_anime.dart';

Future<Iterable<AnimeRankingItem>> fetchAnimeByRankingTypeApi({
  required String rankingType,
  required int limit,
}) async {
  final baseUrl =
      'https://api.myanimelist.net/v2/anime/ranking?ranking_type=$rankingType&limit=$limit';

  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': Constants.clientId,
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> animeNodeList = data['data'];
    final animes = animeNodeList
        .where(
      // Some animes miss main picture so it broke the list view
      // and sometimes even the entire list, and sadly when I checked
      // if the entire node was null, it passes.
      (animeNode) => animeNode['node']['main_picture'] != null,
    )
        .map(
      (node) {
        return AnimeRankingItem.fromJson(node);
      },
    );

    return animes;
  } else {
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}
