import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb/core/http/http_service.dart';
import 'package:tmdb/core/services/main.dart';
import 'package:tmdb/modules/catalog/repositories/main.dart';
import 'package:tmdb/modules/catalog/stores/main.dart';
import 'package:tmdb/modules/catalog/views/catalog_detail_screen/main.dart';
import 'package:tmdb/modules/catalog/views/catalog_screen/main.dart';
import 'package:tmdb/modules/catalog/views/movie_detail_screen/main.dart';
import 'package:tmdb/modules/catalog/views/movie_search_screen/main.dart';

class CatalogModule extends Module {
  static const String catalogRoute = '/catalog';
  static const String catalogDetailRoute = '/catalog/detail';
  static const String movieDetailRoute = '/catalog/detail/movie';
  static const String movieSearchRoute = '/catalog/search';

  @override
  List<Bind> get binds => [
        Bind(
          (i) => CatalogRepository(
            i<HttpService>(),
            language: Localizations.localeOf(getCurrentContext()).languageCode,
          ),
        ),
        Bind(
          (i) => CreditsRepository(
            i<HttpService>(),
            language: Localizations.localeOf(getCurrentContext()).languageCode,
          ),
        ),
        Bind((i) => CatalogStore(i<CatalogRepository>())),
        Bind((i) => MovieStore(i<CatalogRepository>(), i<CreditsRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const CatalogScreen(),
        ),
        ChildRoute(
          '/detail',
          child: (_, args) => CatalogDetailScreen(
            category: args.data,
          ),
        ),
        ChildRoute(
          '/detail/movie',
          child: (_, args) => MovieDetailScreen(
            movie: args.data,
          ),
        ),
        ChildRoute(
          '/search',
          child: (_, args) => const MovieSearchScreen(),
        ),
      ];
}
