import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:tmdb/core/config/environment.dart';
import 'package:tmdb/core/services/navigation.dart';

class System {
  static final System _instance = System._internal();

  factory System() => _instance;

  bool isReady = false;

  final String _environment = Environment.production;

  bool get isProduction => _environment == Environment.production;

  System._internal() {
    _preInit();
  }

  void _preInit() {}

  Future init() async {
    if (!GetIt.I.isRegistered<NavigationService>()) {
      GetIt.I.registerLazySingleton(() => NavigationService());
    }

    if (isReady) {
      return;
    }
    _initEnvironment();
    isReady = true;
  }

  void _initEnvironment() => Environment().initConfig(_environment);
}
