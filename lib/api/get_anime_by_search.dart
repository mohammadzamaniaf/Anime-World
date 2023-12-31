import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/constants/constants.dart';
import '/models/anime_info.dart';
import '/models/anime_node.dart';

Future<Iterable<AnimeNode>> fetchAnimesbySearch({
  required String query,
}) async {
  final baseUrl = "https://api.myanimelist.net/v2/anime?q=$query&limit=10";

  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': Constants.clientId,
    },
  );

  if (response.statusCode == 200) {
    // Successful response
    final Map<String, dynamic> data = json.decode(response.body);
    AnimeInfo animeInfo = AnimeInfo.fromJson(data);
    Iterable<AnimeNode> animes = animeInfo.data;

    return animes;
  } else {
    // Error handling
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}
