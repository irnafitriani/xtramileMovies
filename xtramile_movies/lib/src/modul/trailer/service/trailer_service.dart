import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/environment_config.dart';
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';
import 'package:xtramile_movies/src/network/network_service.dart';

abstract class TrailerService {
  Future<TrailerList?> fetchTrailers(int movieId);
}

@LazySingleton(as: TrailerService)
class TrailerServiceImpl implements TrailerService {
  final NetworkService _networkService;

  TrailerServiceImpl(this._networkService);

  @override
  Future<TrailerList?> fetchTrailers(int movieId) async {
    final request = NetworkRequest(
      path: '/movie/$movieId/videos',
      queryParams: {'api_key': EnvironmentConfig.apiKey},
      type: NetworkRequestType.get,
    );

    TrailerList? result;
    try {
      final response =
          await _networkService.request(request, (response) => (response as Map<String, dynamic>));

      response.maybeWhen(
        ok: (data) async {
          if (data is Map<String, dynamic>) {
            final trailerList = TrailerList.fromJson(data);
            result = trailerList;
          } else {
            result = null;
          }
        },
        noData: (message) {
          result = null;
        },
        orElse: () {
          result = null;
        },
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
