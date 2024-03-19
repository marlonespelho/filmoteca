import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/core/design/assets/main.dart';
import 'package:tmdb/core/design/widgets/default_card.dart';
import 'package:tmdb/core/main.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/modules/catalog/catalog_module.dart';
import 'package:tmdb/modules/catalog/enums/catalog_category_enum.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

class CategoryMovieList extends StatelessWidget {
  final CatalogCategoryEnum category;
  final List<Movie> movies;

  const CategoryMovieList({
    super.key,
    required this.category,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        const SizedBox(height: 16),
        buildMovieList(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              SvgPicture.asset(IconsPath.iconMedalStar),
              SizedBox(width: 8),
              Text(
                CatalogCategoryEnum.getCatalogCategoryEnumTitle(category),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        TextButton(
          key: const Key('showMoreButton'),
          onPressed: handleShowMore,
          child: Text(
            S.current.showMoreLabel,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }

  Widget buildMovieList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: movies.map((movie) => MovieCard(movie: movie)).toList(),
          ),
          showMoreButton(),
        ],
      ),
    );
  }

  Widget showMoreButton() {
    return DefaultCard(
      onTap: handleShowMore,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Container(
        width: 154,
        height: 315,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            S.current.showMoreLabel,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  handleShowMore() {
    pushNamed(
      routeName: CatalogModule.catalogDetailRoute,
      arguments: category,
    );
  }
}
