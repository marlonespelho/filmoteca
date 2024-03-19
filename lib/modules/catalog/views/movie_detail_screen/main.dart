import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/core/design/widgets/default_app_bar.dart';
import 'package:tmdb/core/design/widgets/default_card.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/stores/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final MovieStore store = Modular.get<MovieStore>();

  @override
  void initState() {
    store.lastMovieSelected.add(widget.movie);
    store.getMovieDetails(widget.movie);
    super.initState();
  }

  void dispose() {
    store.reset();
    store.lastMovieSelected.removeLast();

    if (store.lastMovieSelected.isNotEmpty) {
      store.getMovieDetails(store.lastMovieSelected.last);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    store.getMovieDetails(widget.movie);

    return Scaffold(
      appBar: DefaultAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Observer(builder: (context) {
      if (store.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildImage(),
            SizedBox(height: 8),
            buildTitle(),
            buildReleaseDate(),
            buildGenres(),
            buildOverview(),
            CastList(castList: store.castList!),
            buildSimilarMovies(),
          ],
        ),
      );
    });
  }

  Widget buildOverview() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Text(
        store.movieDetails!.overview ?? "",
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
            ),
      ),
    );
  }

  Widget buildGenres() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Wrap(
        runSpacing: 8,
        children: store.movieDetails!.genres
            .map((e) => DefaultCard(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    e.name,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget buildReleaseDate() {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: 8),
      child: Text(
        S.current.releaseAtLabel(DateFormat.yMd(Intl.defaultLocale).format(store.movieDetails!.releaseDate)),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 16,
            ),
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              widget.movie.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
            ),
          ),
        ),
        SizedBox(width: 16),
        DefaultCard(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.all(8),
          color: store.getColorByVoteAverage(),
          child: Text(
            store.movieDetails!.voteAverage.toStringAsFixed(1),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                  color: Palette.secondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    return Align(
      alignment: Alignment.center,
      child: TMDBImage(
        movie: widget.movie,
        details: true,
      ),
    );
  }

  buildSimilarMovies() {
    if (store.similarMovies == null) return Container();
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.similarMoviesTitleLabel,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: store.similarMovies!.results.map((movie) => MovieCard(movie: movie)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
