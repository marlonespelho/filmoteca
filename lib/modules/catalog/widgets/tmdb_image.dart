import 'package:flutter/material.dart';
import 'package:tmdb/core/config/main.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/core/design/widgets/main.dart';
import 'package:tmdb/modules/catalog/models/main.dart';

class TMDBImage extends StatelessWidget {
  final Movie movie;
  final bool details;

  const TMDBImage({super.key, required this.movie, this.details = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Image.network(
        "${getImagePath()}${movie.posterPath}",
        fit: BoxFit.cover,
        width: details ? 220 : 154,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: DefaultCircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: details ? 220 : 154,
            height: 232,
            color: Palette.accent,
            child: Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white,
                size: 48,
              ),
            ),
          );
        },
      ),
    );
  }

  getImagePath() {
    return Environment().config.TMDBImageBannerUrl;
  }
}
