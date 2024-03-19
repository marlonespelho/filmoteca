import 'package:flutter/foundation.dart';
import 'package:tmdb/core/shared/contants.dart';

abstract class BaseConfig {
  String get environmentName;

  String get TMDBApiKey;

  String get TMDBImageBaseUrl;

  String get TMDBImageBannerUrl;

  String get TMDBImageCastUrl;
}

class ProductionConfig extends BaseConfig {
  @override
  String get environmentName => 'Production';

  @override
  String get TMDBApiKey => kIsWeb
      ? '1434ed4983a3f70fb3521e0a69c24272'
      : String.fromEnvironment(Constants.TMDBApiKey, defaultValue: '1434ed4983a3f70fb3521e0a69c24272');

  @override
  String get TMDBImageBaseUrl => 'https://image.tmdb.org/t/p/';

  @override
  String get TMDBImageBannerUrl => '${TMDBImageBaseUrl}w154';

  @override
  String get TMDBImageCastUrl => '${TMDBImageBaseUrl}w138_and_h175_face';
}
