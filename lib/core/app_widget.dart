import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/core/config/system.dart';
import 'package:tmdb/core/design/theme/main.dart';
import 'package:tmdb/core/main.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      Modular.setNavigatorKey(GetIt.I.get<NavigationService>().navigatorKey);
      Modular.setInitialRoute('/splash-screen');

      bool isProduction = System().isProduction;
      return MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown
        }),
        debugShowCheckedModeBanner: !isProduction,
        supportedLocales: const <Locale>[
          Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
        ],
        theme: DefaultTheme.getTheme(context),
      );
    });
  }
}
