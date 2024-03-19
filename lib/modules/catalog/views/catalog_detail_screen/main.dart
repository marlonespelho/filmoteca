import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb/core/design/widgets/main.dart';
import 'package:tmdb/modules/catalog/enums/catalog_category_enum.dart';
import 'package:tmdb/modules/catalog/stores/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

class CatalogDetailScreen extends StatefulWidget {
  final CatalogCategoryEnum category;

  const CatalogDetailScreen({super.key, required this.category});

  @override
  State<CatalogDetailScreen> createState() => _CatalogDetailScreenState();
}

class _CatalogDetailScreenState extends State<CatalogDetailScreen> {
  final CatalogStore store = Modular.get<CatalogStore>();
  ScrollController scroollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scroollController.addListener(() {
      if (scroollController.position.pixels == scroollController.position.maxScrollExtent && !store.isLoading) {
        store.fetchMoviesByCategory(widget.category);
      }
    });
  }

  @override
  void dispose() {
    scroollController.dispose();
    store.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: CatalogCategoryEnum.getCatalogCategoryEnumTitle(widget.category),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Observer(builder: (context) {
      return RefreshIndicator(
        onRefresh: () async {
          store.reset();
        },
        child: Scrollbar(
          controller: scroollController,
          interactive: true,
          child: SingleChildScrollView(
            controller: scroollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    spacing: 32,
                    runSpacing: 16,
                    children: store.getMoviesByCategory(widget.category).map<Widget>((movie) {
                      return MovieCard(
                        movie: movie,
                        marging: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                ),
                if (store.isLoading)
                  Center(
                    child: DefaultCircularProgressIndicator(),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 600 ? MediaQuery.of(context).size.height * 0.6 : 64,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
