import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb/core/design/assets/main.dart';

class DefaultLogo extends StatelessWidget {
  final EdgeInsets? margin;
  final double? width;

  const DefaultLogo({Key? key, this.margin, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SvgPicture.asset(
        IconsPath.iconLogo,
        width: width ?? MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
