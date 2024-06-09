import 'package:flutter/material.dart';
import 'package:xtramile_movies/src/di/service_locator.dart';
import 'package:xtramile_movies/src/settings_controller.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  setupServiceLocator();
  runApp(MyApp(settingsController: settingsController));
}
