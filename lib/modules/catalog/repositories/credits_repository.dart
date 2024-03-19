import 'package:tmdb/core/http/main.dart';
import 'package:tmdb/modules/catalog/models/main.dart';

class CreditsRepository {
  final HttpService httpService;

  CreditsRepository(this.httpService, {String? language});

  String language = 'pt-BR';

  void setLanguage(String language) {
    this.language = language;
  }

  Future<List<Cast>> getCast({required int movieId}) async {
    final response = await _getAndParse('/movie/$movieId/credits');
    return Credits.fromJson(response).cast;
  }

  Future<dynamic> _getAndParse(String path) async {
    final response = await httpService.get(path: path, queryParams: {'language': language});
    return response;
  }
}
