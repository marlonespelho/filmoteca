import 'package:tmdb/core/http/main.dart';
import 'package:tmdb/modules/catalog/models/main.dart';

class CatalogRepository {
  final HttpService httpService;
  String language = 'pt-BR';

  CatalogRepository(this.httpService, {required this.language});

  Future<Page<Movie>> discoverMovies({int page = 1}) async {
    return await _getAndParseData(path: '/discover/movie', page: page);
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    final response = await httpService.get(path: '/movie/$movieId', queryParams: {'language': language});
    return MovieDetails.fromJson(response);
  }

  Future<Page<Movie>> topRatedMovies({int page = 1}) async {
    return await _getAndParseData(path: '/movie/top_rated', page: page);
  }

  Future<Page<Movie>> popularMovies({int page = 1}) async {
    return await _getAndParseData(path: '/movie/popular', page: page);
  }

  Future<Page<Movie>> nowPlayingMovies({int page = 1}) async {
    return await _getAndParseData(path: '/movie/now_playing', page: page);
  }

  Future<Page<Movie>> upcomingMovies({int page = 1}) async {
    return await _getAndParseData(path: '/movie/upcoming', page: page);
  }

  Future<Page<Movie>> similarMovies(int movieId, {int page = 1}) async {
    return await _getAndParseData(path: '/movie/$movieId/similar', page: page);
  }

  Future<Page<Movie>> searchMovies(String query, {int page = 1}) async {
    return await _getAndParseData(path: '/search/movie', page: page, queryParams: {'query': query});
  }

  _getAndParseData({
    required String path,
    Map<String, dynamic>? queryParams,
    int page = 1,
    data,
  }) async {
    Map<String, dynamic> defaultQueryParams = {'language': language, 'page': page};
    defaultQueryParams.addAll(queryParams ?? {});
    final response = await httpService.get(
      path: path,
      data: data,
      queryParams: defaultQueryParams,
    );
    return Page.fromJson(response, (json) => Movie.fromJson(json));
  }
}
