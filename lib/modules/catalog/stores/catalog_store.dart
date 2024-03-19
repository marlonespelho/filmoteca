import 'package:mobx/mobx.dart';
import 'package:tmdb/modules/catalog/enums/catalog_category_enum.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/repositories/catalog_repository.dart';

part 'catalog_store.g.dart';

class CatalogStore = CatalogStoreBase with _$CatalogStore;

abstract class CatalogStoreBase with Store {
  final CatalogRepository _catalogRepository;

  CatalogStoreBase(this._catalogRepository);

  @observable
  bool isLoading = false;

  @observable
  Page<Movie>? discoverMoviesPage;

  @observable
  List<Movie> discoverMovies = [];

  @observable
  Page<Movie>? popularMoviesPage;

  @observable
  List<Movie> popularMovies = [];

  @observable
  Page<Movie>? topRatedMoviesPage;

  @observable
  List<Movie> topRatedMovies = [];

  @observable
  Page<Movie>? upcomingMoviesPage;

  @observable
  List<Movie> upcomingMovies = [];

  @observable
  Page<Movie>? nowPlayingMoviesPage;

  @observable
  List<Movie> nowPlayingMovies = [];

  @observable
  String query = '';

  @observable
  Page<Movie>? searchMoviesPage;

  @observable
  List<Movie> searchMovies = [];

  @action
  void setIsLoading(bool value) => isLoading = value;

  init() async {
    await fetchDiscoverMovies();
    await fetchPopularMovies();
    await fetchTopRatedMovies();
    await fetchUpcomingMovies();
    await fetchNowPlayingMovies();
  }

  reset() async {
    discoverMoviesPage = null;
    popularMoviesPage = null;
    topRatedMoviesPage = null;
    upcomingMoviesPage = null;
    nowPlayingMoviesPage = null;
    await init();
  }

  resetSearch() {
    query = '';
    searchMoviesPage = null;
    searchMovies = [];
  }

  @action
  Future<void> fetchDiscoverMovies() async {
    setIsLoading(true);
    if (discoverMoviesPage == null) {
      discoverMoviesPage = await _catalogRepository.discoverMovies(page: 1);
      discoverMovies = discoverMoviesPage!.results;
      setIsLoading(false);
      return;
    }

    if (discoverMoviesPage!.hasMore) {
      discoverMoviesPage = await _catalogRepository.discoverMovies(page: discoverMoviesPage!.nextPage);
      discoverMovies.addAll(discoverMoviesPage!.results);
      setIsLoading(false);
      return;
    }
  }

  @action
  Future<void> fetchPopularMovies() async {
    setIsLoading(true);
    if (popularMoviesPage == null) {
      popularMoviesPage = await _catalogRepository.popularMovies(page: 1);
      popularMovies = popularMoviesPage!.results;
      setIsLoading(false);
      return;
    }

    if (popularMoviesPage!.hasMore) {
      popularMoviesPage = await _catalogRepository.popularMovies(page: popularMoviesPage!.nextPage);
      popularMovies.addAll(popularMoviesPage!.results);
      setIsLoading(false);
      return;
    }
  }

  @action
  Future<void> fetchTopRatedMovies() async {
    setIsLoading(true);
    if (topRatedMoviesPage == null) {
      topRatedMoviesPage = await _catalogRepository.topRatedMovies(page: 1);
      topRatedMovies = topRatedMoviesPage!.results;
      setIsLoading(false);
      return;
    }

    if (topRatedMoviesPage!.hasMore) {
      topRatedMoviesPage = await _catalogRepository.topRatedMovies(page: topRatedMoviesPage!.nextPage);
      topRatedMovies.addAll(topRatedMoviesPage!.results);
      setIsLoading(false);
      return;
    }
  }

  @action
  Future<void> fetchUpcomingMovies() async {
    setIsLoading(true);
    if (upcomingMoviesPage == null) {
      upcomingMoviesPage = await _catalogRepository.upcomingMovies(page: 1);
      upcomingMovies = upcomingMoviesPage!.results;
      setIsLoading(false);
      return;
    }

    if (upcomingMoviesPage!.hasMore) {
      upcomingMoviesPage = await _catalogRepository.upcomingMovies(page: upcomingMoviesPage!.nextPage);
      upcomingMovies.addAll(upcomingMoviesPage!.results);
      setIsLoading(false);
      return;
    }
  }

  @action
  Future<void> fetchNowPlayingMovies() async {
    setIsLoading(true);
    if (nowPlayingMoviesPage == null) {
      nowPlayingMoviesPage = await _catalogRepository.nowPlayingMovies(page: 1);
      nowPlayingMovies = nowPlayingMoviesPage!.results;
      setIsLoading(false);
      return;
    }

    if (nowPlayingMoviesPage!.hasMore) {
      nowPlayingMoviesPage = await _catalogRepository.nowPlayingMovies(page: nowPlayingMoviesPage!.nextPage);
      nowPlayingMovies.addAll(nowPlayingMoviesPage!.results);
      setIsLoading(false);
      return;
    }
  }

  @action
  searchMoviesByQuery(String query) async {
    this.query = query;
    if (query.length > 1) {
      setIsLoading(true);
      searchMoviesPage = await _catalogRepository.searchMovies(query);
      searchMovies = searchMoviesPage!.results;
      setIsLoading(false);
    }
  }

  @action
  Future<void> fetchMoreSearchMovies() async {
    if (searchMoviesPage!.hasMore) {
      searchMoviesPage = await _catalogRepository.searchMovies(query, page: searchMoviesPage!.nextPage);
      searchMovies.addAll(searchMoviesPage!.results);
    }
  }

  getMoviesByCategory(CatalogCategoryEnum category) {
    return {
      CatalogCategoryEnum.discoverMovies: discoverMovies,
      CatalogCategoryEnum.popularMovies: popularMovies,
      CatalogCategoryEnum.topRatedMovies: topRatedMovies,
      CatalogCategoryEnum.upcomingMovies: upcomingMovies,
      CatalogCategoryEnum.nowPlayingMovies: nowPlayingMovies,
    }[category];
  }

  fetchMoviesByCategory(CatalogCategoryEnum category) {
    switch (category) {
      case CatalogCategoryEnum.discoverMovies:
        fetchDiscoverMovies();
        return;
      case CatalogCategoryEnum.popularMovies:
        fetchPopularMovies();
        return;
      case CatalogCategoryEnum.topRatedMovies:
        fetchTopRatedMovies();
        return;
      case CatalogCategoryEnum.upcomingMovies:
        fetchUpcomingMovies();
        return;
      case CatalogCategoryEnum.nowPlayingMovies:
        fetchNowPlayingMovies();
        return;
    }
  }
}
