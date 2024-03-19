import 'package:flutter/material.dart';
import 'package:tmdb/core/design/theme/main.dart';

class DefaultElevatedButton extends StatelessWidget {
  final Function onPressed;
  final dynamic text;
  final bool disable;
  final double elevation;
  final Color color;
  final Color textColor;
  final Color loadingColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Function? onLongPress;
  final Color? borderColor;
  final double borderWidth;
  final double? width;
  final bool loading;
  final Color disableColor;
  final bool shadow;
  final Color splashColor;

  const DefaultElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.disable = false,
      this.elevation = 2.0,
      this.borderRadius = const BorderRadius.all(Radius.circular(16.0)),
      this.color = Palette.secondary,
      this.textColor = Colors.white,
      this.loadingColor = Palette.secondary,
      this.borderColor,
      this.disableColor = Palette.neutral600,
      this.margin = const EdgeInsets.all(16),
      this.padding = const EdgeInsets.all(8),
      this.onLongPress,
      this.borderWidth = 0.0,
      this.width,
      this.loading = false,
      this.shadow = true,
      this.splashColor = Palette.primaryMedium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: BoxConstraints(
        maxWidth: width ?? MediaQuery.of(context).size.width * .65,
      ),
      decoration: BoxDecoration(
        boxShadow: boxShadow(),
      ),
      child: Card(
        color: buttonColor(),
        elevation: elevation,
        shape: shapeButton(),
        child: InkWell(
          onTap: disable || loading ? null : () => onPressed(),
          onLongPress: onLongPress == null || disable || loading ? null : () => onLongPress!(),
          borderRadius: borderRadius,
          splashColor: splashColor,
          overlayColor: MaterialStateProperty.all(Palette.hoverButton),
          child: Container(
            padding: padding,
            alignment: Alignment.center,
            child: loading ? loadingIndicator() : buildText(context),
          ),
        ),
      ),
    );
  }

  buildText(BuildContext context) {
    return text is String
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                text!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          )
        : text;
  }

  loadingIndicator() {
    return CircularProgressIndicator(
      strokeWidth: 1,
      color: textColor,
    );
  }

  RoundedRectangleBorder shapeButton() {
    return RoundedRectangleBorder(
      side: borderColor == null
          ? const BorderSide(color: Colors.transparent)
          : BorderSide(
              color: borderColor!,
              width: borderWidth,
            ),
      borderRadius: borderRadius,
    );
  }

  Color buttonColor() {
    return disable
        ? disableColor
        : loading
            ? loadingColor
            : color;
  }

  List<BoxShadow>? boxShadow() {
    return shadow
        ? [
            const BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: Color.fromRGBO(37, 7, 68, 0.1),
              offset: Offset(5, 0),
            ),
          ]
        : null;
  }
}
