import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  final Color? color;

  const DefaultCircularProgressIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 32),
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: color,
      ),
    );
  }
}
