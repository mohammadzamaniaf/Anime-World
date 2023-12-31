import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/constants/constants.dart';
import '/models/anime_info.dart';

Future<AnimeInfo> fetchSeasonalAnimes({
  required String season,
  required int limit,
}) async {
  final year = DateTime.now().year;
  final baseUrl =
      "https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit";

  // Make a GET request
  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': Constants.clientId,
    },
  );

  if (response.statusCode == 200) {
    // Successful response
    final Map<String, dynamic> data = json.decode(response.body);
    final seasonalAnime = AnimeInfo.fromJson(data);

    return seasonalAnime;
  } else {
    // Error handling
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}
