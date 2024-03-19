import 'dart:convert';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter/services.dart';
import 'package:tmdb/core/config/main.dart';
import 'package:tmdb/core/main.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:faker/faker.dart';
import 'package:tmdb/modules/catalog/repositories/main.dart';

class CatalogRepositoryMock extends Mock implements CatalogRepository {}

Page<Movie> getMoviePage({int page = 1}) {
  return Page<Movie>(
    page: page,
    results: [generateMovieMock(), generateMovieMock()],
    totalPages: 2,
    totalResults: 2,
  );
}

generateMovieMock() {
  Faker faker = Faker();
  return Movie(
    id: faker.randomGenerator.integer(9999),
    title: faker.lorem.word(),
    overview: faker.lorem.sentence(),
    posterPath: faker.lorem.word(),
    backdropPath: faker.lorem.word(),
    releaseDate: faker.date.dateTime(minYear: 1920, maxYear: 2024),
    voteAverage: faker.randomGenerator.decimal(),
    isAdult: faker.randomGenerator.boolean(),
    genreIds: [1, 2],
    originCountry: ['US'],
    originalLanguage: 'en-US',
    hasVideo: faker.randomGenerator.boolean(),
    voteCount: faker.randomGenerator.integer(9999),
    originalTitle: faker.lorem.word(),
    popularity: faker.randomGenerator.decimal(),
  );
}

getMovieDetailsMock() {
  return MovieDetails(
    adult: false,
    backdropPath: faker.image.image(),
    genres: [Genre(id: 1, name: 'Action')],
    homepage: faker.internet.httpUrl(),
    id: 1,
    imdbId: faker.guid.guid(),
    originalLanguage: 'en',
    originalTitle: faker.lorem.word(),
    overview: faker.lorem.sentence(),
    popularity: 100.0,
    posterPath: faker.image.image(),
    productionCompanies: [ProductionCompany(id: 1, logoPath: null, name: 'Company', originCountry: 'US')],
    productionCountries: [ProductionCountry(iso31661: 'US', name: 'United States')],
    releaseDate: DateTime.now(),
    revenue: 1000000,
    runtime: 120,
    spokenLanguages: [
      SpokenLanguage(iso6391: 'en', name: 'English', englishName: 'English'),
    ],
    status: 'Released',
    tagline: faker.lorem.sentence(),
    title: faker.lorem.word(),
    video: false,
    voteAverage: 10.0,
    voteCount: 100,
  );
}

Future<void> startApp() async {
  await System().init();

  runApp(DefaultAssetBundle(bundle: TestAssetBundle(), child: AppCore()));
}

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async =>
      utf8.decode((await load(key)).buffer.asUint8List());
  @override
  Future<ByteData> load(String key) async => rootBundle.load(key);
}
