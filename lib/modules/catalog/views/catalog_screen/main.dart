import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb/core/design/widgets/main.dart';
import 'package:tmdb/modules/catalog/enums/catalog_category_enum.dart';
import 'package:tmdb/modules/catalog/main.dart';
import 'package:tmdb/modules/catalog/stores/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final CatalogStore store = Modular.get<CatalogStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          key: const Key('homeAppBar'),
        ),
        body: buildBody(),
        floatingActionButton: FloatingActionButton(
          key: const Key('searchButton'),
          onPressed: () {
            Modular.to.pushNamed(CatalogModule.movieSearchRoute);
          },
          child: const Icon(Icons.search),
        ));
  }

  Widget buildBody() {
    return Observer(builder: (context) {
      return store.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [DefaultCircularProgressIndicator()],
            )
          : RefreshIndicator(
              onRefresh: () async {
                await store.reset();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CategoryMovieList(
                      movies: store.popularMovies,
                      category: CatalogCategoryEnum.popularMovies,
                    ),
                    CategoryMovieList(
                      movies: store.topRatedMovies,
                      category: CatalogCategoryEnum.topRatedMovies,
                    ),
                    CategoryMovieList(
                      movies: store.nowPlayingMovies,
                      category: CatalogCategoryEnum.nowPlayingMovies,
                    ),
                    CategoryMovieList(
                      movies: store.upcomingMovies,
                      category: CatalogCategoryEnum.upcomingMovies,
                    ),
                    CategoryMovieList(
                      movies: store.discoverMovies,
                      category: CatalogCategoryEnum.discoverMovies,
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
