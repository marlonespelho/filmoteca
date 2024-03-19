import 'package:flutter/material.dart';
import 'package:tmdb/core/config/main.dart';
import 'package:tmdb/core/main.dart';

Future<void> main() async {
  await System().init();

  WidgetsFlutterBinding.ensureInitialized();
   runApp(const AppCore());
}
