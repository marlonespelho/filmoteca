import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb/core/http/dio/dio_http_service.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/repositories/main.dart';
import 'package:faker/faker.dart';

class MockHttpClient extends Mock implements DioHttpService {}

void main() {
  late MockHttpClient httpClient;
  late CreditsRepository creditsRepository;

  setUp(() {
    httpClient = MockHttpClient();
    creditsRepository = CreditsRepository(httpClient, language: 'pt-BR');
  });

  group('Should test Credits Repository', () {
    test('Should return a list of movie cast', () async {
      String path = '/movie/1/credits';
      Map queryParams = {'language': 'pt-BR'};
      Map<String, dynamic> json = _generateCastJsonMock();

      when(() => httpClient.get(path: path, queryParams: queryParams)).thenAnswer((_) async => json);
      List<Cast> castList = await creditsRepository.getCast(movieId: 1);

      verify(() => httpClient.get(path: path, queryParams: queryParams)).called(1);
      List<Cast> expected = (json['cast'] as List).map((e) => Cast.fromJson(e)).toList();
      expect(castList.runtimeType, expected.runtimeType);
    });
  });
}

Map<String, dynamic> _generateCastJsonMock() {
  return {
    "id": 1,
    "cast": [
      {
        "adult": false,
        "id": 1,
        "known_for_department": "Acting",
        "name": Faker.withGenerator(random).person.firstName(),
        "original_name": Faker.withGenerator(random).person.name(),
        "popularity": 8.5,
        "profile_path": "/path/to/profile.jpg",
        "credit_id": Faker.withGenerator(random).lorem.random.string(10),
        "character": Faker.withGenerator(random).person.name()
      },
      {
        "adult": false,
        "id": 2,
        "known_for_department": "Comedy",
        "name": Faker.withGenerator(random).person.firstName(),
        "original_name": Faker.withGenerator(random).person.name(),
        "popularity": 7.5,
        "profile_path": "/path/to/profile2.jpg",
        "credit_id": Faker.withGenerator(random).lorem.random.string(10),
        "character": Faker.withGenerator(random).person.name()
      }
    ]
  };
}
