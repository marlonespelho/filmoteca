import 'package:flutter/material.dart';
import 'package:tmdb/core/design/theme/main.dart';

class DefaultCard extends StatelessWidget {
  final double elevation;
  final Color? color;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Function? onTap;
  final Function? onLongPress;
  final Widget child;
  final Color? borderColor;
  final double borderWidth;

  const DefaultCard({
    Key? key,
    this.elevation = 2.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.color,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.onLongPress,
    required this.child,
    this.borderColor,
    this.borderWidth = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Palette.secondary,
      elevation: elevation,
      margin: margin,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(
          width: borderWidth,
          color: borderColor ?? Theme.of(context).cardColor,
        ),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: InkWell(
          child: child,
          borderRadius: borderRadius,
          onTap: onTap == null ? null : () => onTap!(),
          onLongPress: onLongPress == null ? null : () => onLongPress!(),
        ),
      ),
    );
  }
}
