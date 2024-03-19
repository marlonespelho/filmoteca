import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/core/design/widgets/main.dart';
import 'package:tmdb/core/services/main.dart';
import 'package:tmdb/modules/catalog/catalog_module.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _timeFirstAnimate = 1000;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(milliseconds: _timeFirstAnimate + 1200),
      );
      pushReplacementNamed(routeName: CatalogModule.catalogRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('splashScreen'),
      color: Palette.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logo(context),
          Flexible(
            flex: 1,
            child: DefaultCircularProgressIndicator(color: Palette.accent).animate()
              ..fade(duration: Duration(milliseconds: _timeFirstAnimate))
              ..slideY(
                delay: Duration(milliseconds: _timeFirstAnimate),
                duration: const Duration(milliseconds: 300),
                begin: 1,
                end: 0,
              ),
          ),
        ],
      ),
    );
  }

  Expanded _logo(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: const DefaultLogo().animate()
          ..fade(duration: Duration(milliseconds: _timeFirstAnimate))
          ..slideY(
            delay: Duration(milliseconds: _timeFirstAnimate),
            duration: const Duration(milliseconds: 300),
            begin: -2.0,
            end: 0,
          ),
      ),
    );
  }
}
