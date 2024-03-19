import 'package:tmdb/generated/l10n.dart';

enum CatalogCategoryEnum {
  popularMovies,
  topRatedMovies,
  nowPlayingMovies,
  upcomingMovies,
  discoverMovies;

  static getCatalogCategoryEnumValue(String value) {
    switch (value) {
      case 'popularMovies':
        return CatalogCategoryEnum.popularMovies;
      case 'topRatedMovies':
        return CatalogCategoryEnum.topRatedMovies;
      case 'nowPlayingMovies':
        return CatalogCategoryEnum.nowPlayingMovies;
      case 'upcomingMovies':
        return CatalogCategoryEnum.upcomingMovies;
      case 'discoverMovies':
        return CatalogCategoryEnum.discoverMovies;
      default:
        return null;
    }
  }

  static getCatalogCategoryEnumTitle(CatalogCategoryEnum value) {
    switch (value) {
      case CatalogCategoryEnum.popularMovies:
        return S.current.theMostPopularMoviesLabel;
      case CatalogCategoryEnum.topRatedMovies:
        return S.current.topRatedMoviesLabel;
      case CatalogCategoryEnum.nowPlayingMovies:
        return S.current.nowPlayingMoviesLabel;
      case CatalogCategoryEnum.upcomingMovies:
        return S.current.upcomingMoviesLabel;
      case CatalogCategoryEnum.discoverMovies:
        return S.current.discoverMoviesLabel;
      default:
        return null;
    }
  }
}
