import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/di/service_locator.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
void setupServiceLocator() => serviceLocator.init();
