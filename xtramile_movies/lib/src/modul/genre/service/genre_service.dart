import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/environment_config.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';
import 'package:xtramile_movies/src/network/network_service.dart';

abstract class GenreService {
  Future<List<Genre>> fetchGenres();
}

@LazySingleton(as: GenreService)
class GenreServiceeImpl implements GenreService {
  final NetworkService _networkService;

  GenreServiceeImpl(this._networkService);

  @override
  Future<List<Genre>> fetchGenres() async {
    final request = NetworkRequest(
      path: '/genre/movie/list',
      queryParams: {'api_key': EnvironmentConfig.apiKey},
      type: NetworkRequestType.get,
    );
    List<Genre> result = [];
    try {
      final response =
          await _networkService.request(request, (response) => (response as Map<String, dynamic>));

      response.maybeWhen(
        ok: (data) async {
          if (data is Map<String, dynamic>) {
            final genresResponse = GenresResponse.fromJson(data);
            result = genresResponse.genres;
          } else {
            result = [];
          }
        },
        noData: (message) {
          result = [];
        },
        orElse: () {
          result = [];
        },
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
