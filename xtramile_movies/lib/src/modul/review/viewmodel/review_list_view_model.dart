import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/modul/review/model/review_list.dart';
import 'package:xtramile_movies/src/modul/review/service/review_service.dart';

@injectable
class ReviewListViewModel extends ViewModel<ReviewList> {
  ReviewListViewModel(this._reviewService)
      : super(
          const ReviewList(
            id: 0,
            page: 0,
            results: [],
            totalPages: null,
            totalResults: null,
          ),
        );

  final ReviewService _reviewService;
  bool _isLoadingMore = false;

  void init(int movieId) async {
    await loadUserReviewList(movieId, reset: true);
  }

  Future<void> loadUserReviewList(int id, {bool reset = false}) async {
    if (reset) {
      _updateState(
          showLoading: true, userReviews: [], page: 0, totalPages: null, totalResults: null);
      _isLoadingMore = false;
    }

    if (_isLoadingMore || value.page == value.totalPages) {
      _updateState(showLoading: false);
      return;
    }

    _isLoadingMore = true;
    try {
      _updateState(showLoading: true);
      final currentPage = (value.page ?? 0) + 1;
      final reviews = await _reviewService.fetchUserReviews(id, page: currentPage);
      if (reviews != null) {
        final resultUserReviews = reviews.results;
        final updatedUserReviews = List<Review>.from(value.results)..addAll(resultUserReviews);
        _updateState(
          showLoading: false,
          userReviews: updatedUserReviews,
          page: reviews.page,
          totalPages: reviews.totalPages,
          totalResults: reviews.totalResults,
        );
      } else {
        _updateState(showLoading: false);
      }
    } catch (e) {
      _updateState(showLoading: false);
    } finally {
      _isLoadingMore = false;
    }
  }

  void _updateState({
    List<Review>? userReviews,
    int? id,
    bool? showLoading,
    int? page,
    int? totalPages,
    int? totalResults,
  }) {
    stateData = ReviewList(
      showLoading: showLoading ?? value.showLoading,
      results: userReviews ?? value.results,
      page: page ?? value.page,
      totalPages: totalPages ?? value.totalPages,
      totalResults: totalResults ?? value.totalResults,
      id: id,
    );
  }

  Future<void> fetchMoreMovies(int movieId) async {
    await loadUserReviewList(movieId);
  }
}
