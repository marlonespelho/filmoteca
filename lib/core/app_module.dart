import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdb/core/design/widgets/splash_screen.dart';
import 'package:tmdb/core/services/tmdb_http_service.dart';
import 'package:tmdb/modules/catalog/main.dart';

class AppModule extends Module {
  static const String splashScreenRoute = "/splash-screen";

  @override
  List<Bind> get binds => [
        Bind((i) => TMDBHttpService(
              baseUrl: 'https://api.themoviedb.org/3/',
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(splashScreenRoute, child: (_, args) => const SplashScreen()),
        ModuleRoute(CatalogModule.catalogRoute, module: CatalogModule()),
      ];
}
