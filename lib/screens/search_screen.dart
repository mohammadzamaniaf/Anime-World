import 'dart:async';

import 'package:flutter/material.dart';

import '/api/get_anime_by_search.dart';
import '/constants/constants.dart';
import '/models/anime_node.dart';
import '/widgets/anime_list_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  List<AnimeNode> animes = [];
  Timer? debouncer;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final animes = await fetchAnimesbySearch(
      query: _controller.text.trim(),
    );

    setState(() {
      this.animes = animes.toList();
    });
  }

  Future searchAnime(String query) async => debounce(() async {
        final animes = await fetchAnimesbySearch(query: query);

        if (!mounted) return;

        setState(() {
          this.animes = animes.toList();
        });
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // AppBar Widget
          _buildAppBarWidget(),

          // Divider
          const Divider(
            color: Colors.blue,
            thickness: 3,
            height: 0,
          ),

          // Search Results
          Expanded(
            child: SearchResultsView(
              animes: animes,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarWidget() {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 12.0,
        right: 12.0,
      ),
      color: Theme.of(context).shadowColor,
      child: SearchTextField(
        controller: _controller,
        onChanged: searchAnime,
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          filled: true,
          fillColor: Theme.of(context).shadowColor,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({
    super.key,
    required this.animes,
  });

  final Iterable<AnimeNode> animes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.defaultPadding,
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes.elementAt(index);

          return AnimeListTile(
            anime: anime,
          );
        },
      ),
    );
  }
}
