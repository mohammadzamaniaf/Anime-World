import 'package:anime_world/screens/view_all_seasonal_animes_screen.dart';
import 'package:flutter/material.dart';

import '/api/get_seasonal_animes.dart';
import '/common/utils/utils.dart';
import '/screens/anime_details_screen.dart';
import '/widgets/anime_tile.dart';

class SeasonalAnimeView extends StatelessWidget {
  const SeasonalAnimeView({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final currentSeason = getCurrentSeason();
    return FutureBuilder(
      future: fetchSeasonalAnimes(season: currentSeason, limit: 10),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          final animes = snapshot.data!.data;
          return Column(
            children: [
              // Popular
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ViewAllSeasonalAnimesScreen.routeName,
                          arguments: {
                            'season': currentSeason,
                            'label': label,
                          },
                        );
                      },
                      child: const Text('View all'),
                    ),
                  ],
                ),
              ),
              // Image Slider
              SizedBox(
                height: 350,
                child: ListView.separated(
                  itemCount: animes.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    final anime = animes.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AnimeDetailsScreen.routeName,
                          arguments: anime.id,
                        );
                      },
                      child: AnimeTile(
                        anime: anime,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return Text(
          snapshot.error.toString(),
        );
      },
    );
  }
}
