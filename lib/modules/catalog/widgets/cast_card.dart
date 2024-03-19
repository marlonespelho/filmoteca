import 'package:flutter/material.dart';
import 'package:tmdb/core/config/main.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/core/design/widgets/default_card.dart';
import 'package:tmdb/modules/catalog/models/main.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 260,
      child: DefaultCard(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cast.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (cast.character != null) ...[
                    Text(
                      cast.character!,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ],
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    cast.knownForDepartment,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      child: cast.profilePath == null
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: errorBuilder(),
            )
          : Image.network(
              "${Environment().config.TMDBImageCastUrl}${cast.profilePath!}",
              width: 152,
              height: 180,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return errorBuilder();
              },
            ),
    );
  }

  Container errorBuilder() {
    return Container(
      width: 152,
      height: 172,
      color: Palette.accent,
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.white,
          size: 48,
        ),
      ),
    );
  }
}
