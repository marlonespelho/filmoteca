import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

void pushReplacementNamed({
  required String routeName,
  arguments,
  bool forRoot = false,
}) {
  Modular.to.pushReplacementNamed(
    routeName,
    arguments: arguments,
    forRoot: forRoot,
  );
}

void pushNamed({
  required String routeName,
  arguments,
}) {
  Modular.to.pushNamed(
    routeName,
    arguments: arguments,
  );
}

void pushNamedAndRemoveUntil({
  required String routeName,
  arguments,
}) {
  Modular.to.pushNamedAndRemoveUntil(
    routeName,
    (_) => false,
    arguments: arguments,
  );
}

BuildContext getCurrentContext() {
  return GetIt.I.get<NavigationService>().navigatorKey.currentState!.context;
}
