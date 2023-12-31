import 'package:flutter/material.dart';

import '/common/extensions/extensions.dart';
import '/common/utils/utils.dart';
import '/constants/constants.dart';
import '/screens/home_screen.dart';
import '/widgets/featured_animes.dart';
import '/widgets/seasonal_anime_view.dart';
import '/widgets/top_animes_list.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = getCurrentSeason().capitalize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime World'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                HomeScreen.routeName,
                arguments: 1,
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Animes Slider
            const SizedBox(
              height: 300,
              child: TopAnimesList(),
            ),

            Padding(
              padding: Constants.defaultPadding,
              child: Column(
                children: [
                  // Top Ranked animes
                  const SizedBox(
                    height: 450,
                    child: FeaturedAnimes(
                      rankingType: 'all',
                      label: 'Top Ranked',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Top Popular Animes
                  const SizedBox(
                    height: 450,
                    child: FeaturedAnimes(
                      rankingType: 'bypopularity',
                      label: 'Top Popular',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Top Movie Animes
                  const SizedBox(
                    height: 450,
                    child: FeaturedAnimes(
                      rankingType: 'movie',
                      label: 'Top Movie Animes',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Top Movie Animes
                  const SizedBox(
                    height: 450,
                    child: FeaturedAnimes(
                      rankingType: 'upcoming',
                      label: 'Top Upcoming Animes',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Top Movie Animes
                  SizedBox(
                    height: 450,
                    child: SeasonalAnimeView(
                      label: 'Top Animes this $currentSeason',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
