import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb/core/design/assets/main.dart';
import 'package:tmdb/core/design/theme/main.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const DefaultAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Palette.primary,
      title: title == null
          ? SvgPicture.asset(
              IconsPath.iconLogo,
              alignment: Alignment.center,
            )
          : Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Palette.secondary),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
