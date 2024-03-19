// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on MovieStoreBase, Store {
  late final _$isLoadingAtom = Atom(name: 'MovieStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$movieDetailsAtom = Atom(name: 'MovieStoreBase.movieDetails', context: context);

  @override
  MovieDetails? get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(MovieDetails? value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  late final _$castListAtom = Atom(name: 'MovieStoreBase.castList', context: context);

  @override
  List<Cast>? get castList {
    _$castListAtom.reportRead();
    return super.castList;
  }

  @override
  set castList(List<Cast>? value) {
    _$castListAtom.reportWrite(value, super.castList, () {
      super.castList = value;
    });
  }

  late final _$lastMovieSelectedAtom = Atom(name: 'MovieStoreBase.lastMovieSelected', context: context);

  @override
  List<Movie> get lastMovieSelected {
    _$lastMovieSelectedAtom.reportRead();
    return super.lastMovieSelected;
  }

  @override
  set lastMovieSelected(List<Movie> value) {
    _$lastMovieSelectedAtom.reportWrite(value, super.lastMovieSelected, () {
      super.lastMovieSelected = value;
    });
  }

  late final _$getMovieDetailsAsyncAction = AsyncAction('MovieStoreBase.getMovieDetails', context: context);

  @override
  Future<void> getMovieDetails(Movie movie) {
    return _$getMovieDetailsAsyncAction.run(() => super.getMovieDetails(movie));
  }

  late final _$MovieStoreBaseActionController = ActionController(name: 'MovieStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$MovieStoreBaseActionController.startAction(name: 'MovieStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$MovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
movieDetails: ${movieDetails},
castList: ${castList},
lastMovieSelected: ${lastMovieSelected}
    ''';
  }
}
