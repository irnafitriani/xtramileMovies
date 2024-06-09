import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/environment_config.dart';

@module
abstract class ThirdPartyModule {
    final options = BaseOptions(
    persistentConnection: true,
    baseUrl: EnvironmentConfig.baseUrl,
    connectTimeout: const Duration(seconds: 240),
    receiveTimeout: const Duration(seconds: 240),
    responseType: ResponseType.json,
  );
  @lazySingleton
  Dio get dio => Dio(options);
}