import 'package:flutter/material.dart' show Colors;
import 'package:mobx/mobx.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/repositories/main.dart';

part 'movie_store.g.dart';

class MovieStore = MovieStoreBase with _$MovieStore;

abstract class MovieStoreBase with Store {
  final CatalogRepository _catalogRepository;
  final CreditsRepository _creditsRepository;

  MovieStoreBase(this._catalogRepository, this._creditsRepository);

  @observable
  bool isLoading = false;

  @observable
  MovieDetails? movieDetails;

  @observable
  List<Cast>? castList;

  Page<Movie>? similarMovies;

  @observable
  List<Movie> lastMovieSelected = [];

  @action
  void setIsLoading(bool value) => isLoading = value;

  @action
  Future<void> getMovieDetails(Movie movie) async {
    setIsLoading(true);
    movieDetails = await _catalogRepository.getMovieDetails(movie.id);
    await getCredits(movie.id);
    await getSimilarMovies(movie.id);
    setIsLoading(false);
  }

  getCredits(int movieId) async {
    castList = await _creditsRepository.getCast(movieId: movieId);
  }

  getSimilarMovies(int movieId) async {
    similarMovies = await _catalogRepository.similarMovies(movieId);
  }

  reset() {
    movieDetails = null;
    castList = null;
    similarMovies = null;
  }

  getColorByVoteAverage() {
    if (movieDetails!.voteAverage >= 7) {
      return Palette.success;
    }
    if (movieDetails!.voteAverage >= 5) {
      return Colors.yellow;
    }
    return Palette.error;
  }
}
