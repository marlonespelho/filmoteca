import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/repositories/main.dart';
import 'package:tmdb/modules/catalog/stores/main.dart';
import 'package:tmdb/modules/catalog/test/commom.dart';

class CreditRepositoryMock extends Mock implements CreditsRepository {}

void main() {
  late CatalogRepositoryMock catalogRepositoryMock;
  late CreditRepositoryMock creditRepositoryMock;
  late MovieStore store;

  setUp(() {
    catalogRepositoryMock = CatalogRepositoryMock();
    creditRepositoryMock = CreditRepositoryMock();
    store = MovieStore(catalogRepositoryMock, creditRepositoryMock);
  });

  group('Should test movie store', () {
    Movie movieMock = getMovieMock();
    MovieDetails movieDetailsMock = getMovieDetailsMock();

    test('Should fetch movie details', () async {
      when(() => catalogRepositoryMock.getMovieDetails(movieMock.id)).thenAnswer((_) async => movieDetailsMock);
      when(() => creditRepositoryMock.getCast(movieId: movieMock.id)).thenAnswer((_) async => [getCastMock()]);
      when(() => catalogRepositoryMock.similarMovies(movieMock.id)).thenAnswer((_) async => getMoviePage());

      expect(store.movieDetails, null);

      await store.getMovieDetails(movieMock);
      verify(() => catalogRepositoryMock.getMovieDetails(movieMock.id)).called(1);
      expect(store.movieDetails, movieDetailsMock);
    });

    test('Should fetch movie credits', () async {
      when(() => creditRepositoryMock.getCast(movieId: movieMock.id)).thenAnswer((_) async => [getCastMock()]);

      await store.getCredits(movieMock.id);
      verify(() => creditRepositoryMock.getCast(movieId: movieMock.id)).called(1);
      expect(store.castList, isNotNull);
    });

    test('Should fetch similar movies', () async {
      when(() => catalogRepositoryMock.similarMovies(movieMock.id)).thenAnswer((_) async => getMoviePage());

      await store.getSimilarMovies(movieMock.id);
      verify(() => catalogRepositoryMock.similarMovies(movieMock.id)).called(1);
      expect(store.similarMovies, isNotNull);
    });

    test('Should reset movie details', () async {
      store.reset();
      expect(store.movieDetails, null);
      expect(store.castList, null);
      expect(store.similarMovies, null);
    });

    test('Should get color by vote average', () {
      store.movieDetails = movieDetailsMock;
      expect(store.getColorByVoteAverage(), Palette.success);
    });
  });
}

getMovieMock() {
  return Movie(
    backdropPath: faker.image.image(),
    genreIds: [1],
    id: 1,
    originalLanguage: 'en',
    originalTitle: faker.lorem.word(),
    overview: faker.lorem.sentence(),
    popularity: 100.0,
    posterPath: faker.image.image(),
    releaseDate: DateTime.now(),
    title: faker.lorem.word(),
    hasVideo: false,
    voteAverage: 10.0,
    voteCount: 100,
    isAdult: false,
    originCountry: ['US'],
  );
}

getCastMock() {
  return Cast(
    adult: true,
    id: 1,
    knownForDepartment: 'department',
    name: 'name',
    originalName: 'originalName',
    popularity: 95.2,
    profilePath: 'profilePath',
    creditId: 'creditId',
  );
}

Page<Movie> getMoviePageMock({int page = 1}) {
  return Page<Movie>(
    page: page,
    results: [generateMovieMock(), generateMovieMock()],
    totalPages: 2,
    totalResults: 2,
  );
}
