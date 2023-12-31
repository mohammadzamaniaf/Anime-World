import 'package:flutter/material.dart';

import '/common/extensions/extensions.dart';
import '/constants/constants.dart';
import '/constants/random_colors.dart';
import '/models/anime_category.dart';
import '/screens/category_animes_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.defaultPadding,
      child: ListView.separated(
        itemCount: animeCategories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (context, index) {
          final category = animeCategories[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                CategoryanimesScreen.routeName,
                arguments: category,
              );
            },
            child: CategoryTile(
              category: category,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.index,
  });

  final AnimeCategory category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final randomColor = randomColors.randomItem();
    return Card(
      elevation: 12.0,
      child: Container(
        height: 200,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/wall$index.jpeg',
            ),
          ),
          color: randomColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            category.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
