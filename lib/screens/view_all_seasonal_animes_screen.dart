import 'package:anime_world/widgets/anime_list_view.dart';
import 'package:flutter/material.dart';

import '/api/get_seasonal_animes.dart';
import '/core/screens/error_screen.dart';
import '/core/widgets/loader.dart';

class ViewAllSeasonalAnimesScreen extends StatefulWidget {
  const ViewAllSeasonalAnimesScreen({
    super.key,
    required this.season,
    required this.label,
  });

  final String season;
  final String label;

  static const routeName = '/view-all-seasonal-animes';

  @override
  State<ViewAllSeasonalAnimesScreen> createState() =>
      _ViewAllSeasonalAnimesScreenState();
}

class _ViewAllSeasonalAnimesScreenState
    extends State<ViewAllSeasonalAnimesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchSeasonalAnimes(
        season: widget.season,
        limit: 500,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final animes = snapshot.data!.data;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Top animes'),
            ),
            body: AnimeListView(animes: animes),
          );
        }

        return ErrorScreen(
          error: snapshot.error.toString(),
        );
      },
    );
  }
}
