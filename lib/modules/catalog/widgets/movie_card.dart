import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/core/design/widgets/main.dart';
import 'package:tmdb/core/main.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/modules/catalog/catalog_module.dart';
import 'package:tmdb/modules/catalog/models/main.dart';
import 'package:tmdb/modules/catalog/widgets/main.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final EdgeInsetsGeometry? marging;

  const MovieCard({super.key, required this.movie, this.marging});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 315, minWidth: 1, maxHeight: 320),
      child: DefaultCard(
        elevation: 2,
        onTap: () => pushNamed(routeName: CatalogModule.movieDetailRoute, arguments: movie),
        color: Palette.accent,
        borderWidth: 0,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(12),
        margin: marging ?? EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TMDBImage(movie: movie),
            Container(
              width: 154,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  if (movie.releaseDate != null) ...[
                    Text(
                      S.current.releaseDateLabel(DateFormat.yMd(Intl.defaultLocale).format(movie.releaseDate!)),
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
