import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb/core/design/widgets/default_app_bar.dart';
import 'package:tmdb/core/design/widgets/default_circular_progress_indicator.dart';
import 'package:tmdb/core/design/widgets/default_text_input.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/modules/catalog/stores/catalog_store.dart';
import 'package:tmdb/modules/catalog/widgets/movie_card.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final CatalogStore store = Modular.get<CatalogStore>();

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          store.query.length > 1 &&
          !store.isLoading &&
          store.searchMoviesPage != null &&
          store.searchMoviesPage!.hasMore) {
        store.fetchMoreSearchMovies();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    store.resetSearch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Observer(builder: (context) {
        return Column(
          children: [
            SizedBox(height: 16),
            buildSearchInput(),
            if (store.searchMovies.isEmpty && store.isLoading)
              Center(
                child: DefaultCircularProgressIndicator(),
              ),
            if (store.searchMovies.isEmpty && !store.isLoading && store.query.length > 2) buildEmptyText(context),
            if (store.searchMovies.isNotEmpty)
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    controller: _scrollController,
                    child: Column(
                      children: [
                        buildMoviesList(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget buildEmptyText(BuildContext context) {
    return Center(
      child: Text(
        S.current.searchEmptyLabel,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),
      ),
    );
  }

  Widget buildMoviesList() {
    return Column(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 32,
          runSpacing: 16,
          children: store.searchMovies.map<Widget>((movie) {
            return MovieCard(
              movie: movie,
              marging: EdgeInsets.zero,
            );
          }).toList(),
        ),
        if (store.searchMoviesPage != null && store.searchMoviesPage!.hasMore && store.isLoading)
          Center(child: DefaultCircularProgressIndicator()),
        SizedBox(
          height: MediaQuery.of(context).size.height > 600 ? MediaQuery.of(context).size.height * 0.6 : 64,
        ),
      ],
    );
  }

  TextEditingController _searchController = TextEditingController();

  Widget buildSearchInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DefaultInputTextForm(
        key: const Key('searchInput'),
        controller: _searchController,
        margin: EdgeInsets.zero,
        onChanged: (value) => store.searchMoviesByQuery(value),
        label: S.current.searchLabel,
        hint: S.current.searchHintLabel,
        suffixIcon: Icons.search,
        textInputAction: TextInputAction.search,
        onSubmitted: () => store.searchMoviesByQuery(_searchController.text),
        suffixFunction: () => store.searchMoviesByQuery(_searchController.text),
      ),
    );
  }
}
