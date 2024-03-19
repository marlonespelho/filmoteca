import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/stores/main.dart';
import 'package:tmdb/modules/catalog/test/commom.dart';

void main() {
  late CatalogRepositoryMock catalogRepositoryMock;
  late CatalogStore store;

  setUp(() {
    catalogRepositoryMock = CatalogRepositoryMock();
    store = CatalogStore(catalogRepositoryMock);
  });

  group('Should test catalog store', () {
    test('Should fetch popular movies first page', () async {
      Page<Movie> moviePage = getMoviePage();

      when(() => catalogRepositoryMock.popularMovies(page: 1)).thenAnswer((_) async => moviePage);
      expect(store.popularMoviesPage, null);

      await store.fetchPopularMovies();

      verify(() => catalogRepositoryMock.popularMovies(page: 1)).called(1);
      expect(store.popularMoviesPage, moviePage);
      expect(store.popularMovies.length, 2);
    });

    test('Should fetch popular movies second page', () async {
      Page<Movie> moviePageFirstPage = getMoviePage(page: 1);

      when(() => catalogRepositoryMock.popularMovies(page: 1)).thenAnswer((_) async => moviePageFirstPage);

      expect(store.popularMoviesPage, null);

      await store.fetchPopularMovies();

      verify(() => catalogRepositoryMock.popularMovies(page: 1)).called(1);

      expect(store.popularMoviesPage, moviePageFirstPage);
      expect(store.popularMovies.length, 2);

      Page<Movie> moviePageSecondPage = getMoviePage(page: 2);

      when(() => catalogRepositoryMock.popularMovies(page: 2)).thenAnswer((_) async => moviePageSecondPage);

      await store.fetchPopularMovies();

      verify(() => catalogRepositoryMock.popularMovies(page: 2)).called(1);
      expect(store.popularMoviesPage, moviePageSecondPage);
      expect(store.popularMovies.length, 4);
    });

    test('Should search movies by query', () async {
      Page<Movie> moviePage = getMoviePage();

      when(() => catalogRepositoryMock.searchMovies('query', page: 1)).thenAnswer((_) async => moviePage);
      expect(store.searchMoviesPage, null);

      await store.searchMoviesByQuery('query');

      verify(() => catalogRepositoryMock.searchMovies('query', page: 1)).called(1);
      expect(store.searchMoviesPage, moviePage);
      expect(store.searchMovies.length, 2);
    });

    test('Should fetch movies search second page', () async {
      Page<Movie> moviePageFirstPage = getMoviePage(page: 1);

      when(() => catalogRepositoryMock.searchMovies('query', page: 1)).thenAnswer((_) async => moviePageFirstPage);

      expect(store.searchMoviesPage, null);

      await store.searchMoviesByQuery('query');

      verify(() => catalogRepositoryMock.searchMovies('query', page: 1)).called(1);

      expect(store.searchMoviesPage, moviePageFirstPage);
      expect(store.searchMovies.length, 2);

      Page<Movie> moviePageSecondPage = getMoviePage(page: 2);

      when(() => catalogRepositoryMock.searchMovies('query', page: 2)).thenAnswer((_) async => moviePageSecondPage);

      await store.fetchMoreSearchMovies();

      verify(() => catalogRepositoryMock.searchMovies('query', page: 2)).called(1);
      expect(store.searchMoviesPage, moviePageSecondPage);
      expect(store.searchMovies.length, 4);
    });

    test('Should reset movies search', () async {
      store.resetSearch();
      expect(store.searchMoviesPage, null);
      expect(store.searchMovies, []);
    });

    test('Should reset movies', () async {
      var popularMoviesPage = getMoviePage();
      var discoverMoviesPage = getMoviePage();
      var topRatedMoviesPage = getMoviePage();
      var upcomingMoviesPage = getMoviePage();
      var nowPlayingMoviesPage = getMoviePage();

      when(() => catalogRepositoryMock.popularMovies(page: 1)).thenAnswer((_) async => popularMoviesPage);
      when(() => catalogRepositoryMock.discoverMovies(page: 1)).thenAnswer((_) async => discoverMoviesPage);
      when(() => catalogRepositoryMock.topRatedMovies(page: 1)).thenAnswer((_) async => topRatedMoviesPage);
      when(() => catalogRepositoryMock.upcomingMovies(page: 1)).thenAnswer((_) async => upcomingMoviesPage);
      when(() => catalogRepositoryMock.nowPlayingMovies(page: 1)).thenAnswer((_) async => nowPlayingMoviesPage);

      await store.reset();
      expect(store.popularMoviesPage, popularMoviesPage);
      expect(store.discoverMoviesPage, discoverMoviesPage);
      expect(store.topRatedMoviesPage, topRatedMoviesPage);
      expect(store.upcomingMoviesPage, upcomingMoviesPage);
      expect(store.nowPlayingMoviesPage, nowPlayingMoviesPage);
    });
    test('Should init movies', () async {
      var popularMoviesPage = getMoviePage();
      var discoverMoviesPage = getMoviePage();
      var topRatedMoviesPage = getMoviePage();
      var upcomingMoviesPage = getMoviePage();
      var nowPlayingMoviesPage = getMoviePage();

      when(() => catalogRepositoryMock.popularMovies(page: 1)).thenAnswer((_) async => popularMoviesPage);
      when(() => catalogRepositoryMock.discoverMovies(page: 1)).thenAnswer((_) async => discoverMoviesPage);
      when(() => catalogRepositoryMock.topRatedMovies(page: 1)).thenAnswer((_) async => topRatedMoviesPage);
      when(() => catalogRepositoryMock.upcomingMovies(page: 1)).thenAnswer((_) async => upcomingMoviesPage);
      when(() => catalogRepositoryMock.nowPlayingMovies(page: 1)).thenAnswer((_) async => nowPlayingMoviesPage);

      await store.init();
      expect(store.popularMoviesPage, popularMoviesPage);
      expect(store.discoverMoviesPage, discoverMoviesPage);
      expect(store.topRatedMoviesPage, topRatedMoviesPage);
      expect(store.upcomingMoviesPage, upcomingMoviesPage);
      expect(store.nowPlayingMoviesPage, nowPlayingMoviesPage);
    });

    test('Should fetch discover movies first page', () async {
      Page<Movie> moviePage = getMoviePage();

      when(() => catalogRepositoryMock.discoverMovies(page: 1)).thenAnswer((_) async => moviePage);
      expect(store.discoverMoviesPage, null);

      await store.fetchDiscoverMovies();

      verify(() => catalogRepositoryMock.discoverMovies(page: 1)).called(1);
      expect(store.discoverMoviesPage, moviePage);
      expect(store.discoverMovies.length, 2);
    });

    test('Should fetch discover movies second page', () async {
      Page<Movie> moviePageFirstPage = getMoviePage(page: 1);

      when(() => catalogRepositoryMock.discoverMovies(page: 1)).thenAnswer((_) async => moviePageFirstPage);

      expect(store.discoverMoviesPage, null);

      await store.fetchDiscoverMovies();

      verify(() => catalogRepositoryMock.discoverMovies(page: 1)).called(1);

      expect(store.discoverMoviesPage, moviePageFirstPage);
      expect(store.discoverMovies.length, 2);

      Page<Movie> moviePageSecondPage = getMoviePage(page: 2);

      when(() => catalogRepositoryMock.discoverMovies(page: 2)).thenAnswer((_) async => moviePageSecondPage);

      await store.fetchDiscoverMovies();

      verify(() => catalogRepositoryMock.discoverMovies(page: 2)).called(1);
      expect(store.discoverMoviesPage, moviePageSecondPage);
      expect(store.discoverMovies.length, 4);
    });

    test('Should fetch top rated movies first page', () async {
      Page<Movie> moviePage = getMoviePage();

      when(() => catalogRepositoryMock.topRatedMovies(page: 1)).thenAnswer((_) async => moviePage);
      expect(store.topRatedMoviesPage, null);

      await store.fetchTopRatedMovies();

      verify(() => catalogRepositoryMock.topRatedMovies(page: 1)).called(1);
      expect(store.topRatedMoviesPage, moviePage);
      expect(store.topRatedMovies.length, 2);
    });

    test('Should fetch top rated movies second page', () async {
      Page<Movie> moviePageFirstPage = getMoviePage(page: 1);

      when(() => catalogRepositoryMock.topRatedMovies(page: 1)).thenAnswer((_) async => moviePageFirstPage);

      expect(store.topRatedMoviesPage, null);

      await store.fetchTopRatedMovies();

      verify(() => catalogRepositoryMock.topRatedMovies(page: 1)).called(1);

      expect(store.topRatedMoviesPage, moviePageFirstPage);
      expect(store.topRatedMovies.length, 2);

      Page<Movie> moviePageSecondPage = getMoviePage(page: 2);

      when(() => catalogRepositoryMock.topRatedMovies(page: 2)).thenAnswer((_) async => moviePageSecondPage);

      await store.fetchTopRatedMovies();

      verify(() => catalogRepositoryMock.topRatedMovies(page: 2)).called(1);
      expect(store.topRatedMoviesPage, moviePageSecondPage);
      expect(store.topRatedMovies.length, 4);
    });

    test('Should fetch upcoming movies first page', () async {
      Page<Movie> moviePage = getMoviePage();

      when(() => catalogRepositoryMock.upcomingMovies(page: 1)).thenAnswer((_) async => moviePage);
      expect(store.upcomingMoviesPage, null);

      await store.fetchUpcomingMovies();

      verify(() => catalogRepositoryMock.upcomingMovies(page: 1)).called(1);
      expect(store.upcomingMoviesPage, moviePage);
      expect(store.upcomingMovies.length, 2);
    });

    test('Should fetch upcoming movies second page', () async {
      Page<Movie> moviePageFirstPage = getMoviePage(page: 1);

      when(() => catalogRepositoryMock.upcomingMovies(page: 1)).thenAnswer((_) async => moviePageFirstPage);

      expect(store.upcomingMoviesPage, null);

      await store.fetchUpcomingMovies();

      verify(() => catalogRepositoryMock.upcomingMovies(page: 1)).called(1);

      expect(store.upcomingMoviesPage, moviePageFirstPage);
      expect(store.upcomingMovies.length, 2);

      Page<Movie> moviePageSecondPage = getMoviePage(page: 2);

      when(() => catalogRepositoryMock.upcomingMovies(page: 2)).thenAnswer((_) async => moviePageSecondPage);

      await store.fetchUpcomingMovies();

      verify(() => catalogRepositoryMock.upcomingMovies(page: 2)).called(1);
      expect(store.upcomingMoviesPage, moviePageSecondPage);
      expect(store.upcomingMovies.length, 4);
    });

    test('Should fetch now playing movies first page', () async {
      Page<Movie> moviePage = getMoviePage();

      when(() => catalogRepositoryMock.nowPlayingMovies(page: 1)).thenAnswer((_) async => moviePage);
      expect(store.nowPlayingMoviesPage, null);

      await store.fetchNowPlayingMovies();

      verify(() => catalogRepositoryMock.nowPlayingMovies(page: 1)).called(1);
      expect(store.nowPlayingMoviesPage, moviePage);
      expect(store.nowPlayingMovies.length, 2);
    });

    test('Should fetch now playing movies second page', () async {
      Page<Movie> moviePageFirstPage = getMoviePage(page: 1);

      when(() => catalogRepositoryMock.nowPlayingMovies(page: 1)).thenAnswer((_) async => moviePageFirstPage);

      expect(store.nowPlayingMoviesPage, null);

      await store.fetchNowPlayingMovies();

      verify(() => catalogRepositoryMock.nowPlayingMovies(page: 1)).called(1);

      expect(store.nowPlayingMoviesPage, moviePageFirstPage);
      expect(store.nowPlayingMovies.length, 2);

      Page<Movie> moviePageSecondPage = getMoviePage(page: 2);

      when(() => catalogRepositoryMock.nowPlayingMovies(page: 2)).thenAnswer((_) async => moviePageSecondPage);

      await store.fetchNowPlayingMovies();

      verify(() => catalogRepositoryMock.nowPlayingMovies(page: 2)).called(1);
      expect(store.nowPlayingMoviesPage, moviePageSecondPage);
      expect(store.nowPlayingMovies.length, 4);
    });
  });
}
