import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/environment_config.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_detail.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_list.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';
import 'package:xtramile_movies/src/network/network_service.dart';

abstract class MovieService {
  Future<MovieList?> fetchMoviesByGenre(String genre, {int page = 1});
  Future<MovieDetail?> fetchMovieDetail(int id);
}

@LazySingleton(as: MovieService)
class MovieServiceImpl implements MovieService {
  final NetworkService _networkService;

  MovieServiceImpl(this._networkService);

  @override
  Future<MovieList?> fetchMoviesByGenre(String genre, {int page = 1}) async {
    final request = NetworkRequest(
      path: '/discover/movie',
      queryParams: {'api_key': EnvironmentConfig.apiKey, 'with_genres': genre, 'page': page},
      type: NetworkRequestType.get,
    );
    MovieList? result;
    try {
      final response =
          await _networkService.request(request, (response) => (response as Map<String, dynamic>));

      response.maybeWhen(
        ok: (data) async {
          if (data is Map<String, dynamic>) {
            final movieList = MovieList.fromJson(data);
            result = movieList;
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

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final request = NetworkRequest(
      path: '/movie/$id',
      queryParams: {'api_key': EnvironmentConfig.apiKey},
      type: NetworkRequestType.get,
    );
    MovieDetail? result;
    try {
      final response =
          await _networkService.request(request, (response) => (response as Map<String, dynamic>));

      response.maybeWhen(
        ok: (data) async {
          if (data is Map<String, dynamic>) {
            final movieDetail = MovieDetail.fromJson(data);
            result = movieDetail;
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
