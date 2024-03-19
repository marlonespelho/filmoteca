import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb/core/http/dio/dio_http_service.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/repositories/catalog_repository.dart';

class MockHttpClient extends Mock implements DioHttpService {}

void main() {
  late MockHttpClient httpClient;
  late CatalogRepository catalogRepository;

  setUp(() {
    httpClient = MockHttpClient();
    catalogRepository = CatalogRepository(httpClient, language: 'pt-BR');
  });

  group('Should test Catalog Repository', () {
    test('Should return a list of discover movies', () async {
      String path = '/discover/movie';
      Map queryParams = {'language': 'pt-BR', 'page': 1};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.discoverMovies();

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });

    test('Should return a list of top rated movies', () async {
      String path = '/movie/top_rated';
      Map queryParams = {'language': 'pt-BR', 'page': 1};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.topRatedMovies();

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });

    test('Should return a list of popular movies', () async {
      String path = '/movie/popular';
      Map queryParams = {'language': 'pt-BR', 'page': 1};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.popularMovies();

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });

    test('Should return a list of now playing movies', () async {
      String path = '/movie/now_playing';
      Map queryParams = {'language': 'pt-BR', 'page': 1};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.nowPlayingMovies();

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });

    test('Should return a list of upcoming movies', () async {
      String path = '/movie/upcoming';
      Map queryParams = {'language': 'pt-BR', 'page': 1};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.upcomingMovies();

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });

    test('Should return a list of similar movies', () async {
      int movieId = 1;
      String path = '/movie/$movieId/similar';
      Map queryParams = {'language': 'pt-BR', 'page': 1};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.similarMovies(movieId);

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });

    test('Should return a list of search movies', () async {
      String query = 'movie';
      String path = '/search/movie';
      Map queryParams = {'language': 'pt-BR', 'page': 1, 'query': query};
      Map<String, dynamic> json = _generateMovieMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      Page<Movie> moviePage = await catalogRepository.searchMovies(query);

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      Page<Movie> expected = Page.fromJson(json, (json) => Movie.fromJson(json));
      expect(moviePage.runtimeType, expected.runtimeType);
    });
  });
}

Map<String, dynamic> _generateMovieMock() {
  return {
    "page": 1,
    "results": [
      {
        "id": 1,
        "adult": false,
        "backdrop_path": "/path/to/backdrop.jpg",
        "genre_ids": [1, 2, 3],
        "origin_country": ["US"],
        "original_language": "en",
        "original_title": "Original Movie Title",
        "overview": "This is a brief overview of the movie.",
        "popularity": 8.5,
        "poster_path": "/path/to/poster.jpg",
        "release_date": "2022-01-01",
        "title": "Movie Title",
        "video": false,
        "vote_average": 7.5,
        "vote_count": 120
      },
      {
        "id": 2,
        "adult": false,
        "backdrop_path": "/path/to/backdrop.jpg",
        "genre_ids": [4, 5, 6],
        "origin_country": ["US"],
        "original_language": "en",
        "original_title": "Original Movie Title 2",
        "overview": "This is a brief overview of the movie 2.",
        "popularity": 8.5,
        "poster_path": "/path/to/poster.jpg",
        "release_date": "2022-01-01",
        "title": "Movie Title 2",
        "video": false,
        "vote_average": 8.0,
        "vote_count": 150
      }
    ],
    "total_pages": 10,
    "total_results": 200
  };
}
