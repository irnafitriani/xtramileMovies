import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/environment_config.dart';
import 'package:xtramile_movies/src/modul/review/model/review_list.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';
import 'package:xtramile_movies/src/network/network_service.dart';

abstract class ReviewService {
  Future<ReviewList?> fetchUserReviews(int movieId, {int page = 1});
}

@LazySingleton(as: ReviewService)
class ReviewServiceImpl implements ReviewService {
  final NetworkService _networkService;

  ReviewServiceImpl(this._networkService);

  @override
  Future<ReviewList?> fetchUserReviews(int movieId, {int page = 1}) async {
    final request = NetworkRequest(
      path: '/movie/$movieId/reviews',
      queryParams: {'api_key': EnvironmentConfig.apiKey, 'page': page},
      type: NetworkRequestType.get,
    );

    ReviewList? result;
    try {
      final response =
          await _networkService.request(request, (response) => (response as Map<String, dynamic>));

      response.maybeWhen(
        ok: (data) async {
          if (data is Map<String, dynamic>) {
            final reviewList = ReviewList.fromJson(data);
            result = reviewList;
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
