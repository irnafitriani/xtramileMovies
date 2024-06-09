import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_detail.dart';
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart';
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart';
import 'package:xtramile_movies/src/modul/trailer/service/trailer_service.dart';

@injectable
class MovieDetailViewModel extends ViewModel<MovieDetailData> {
  MovieDetailViewModel(
    this._movieService,
    this._trailerService,
  ) : super(const MovieDetailData(
          showLoading: false,
          movieDetail: null,
          trailers: null,
        ));
  final MovieService _movieService;
  final TrailerService _trailerService;

  init(int id) async {
    await fetchMovieDetail(id);
    await loadTrailerList(id);
  }

  Future<void> fetchMovieDetail(int id) async {
    _updateState(showLoading: true);
    try {
      final movieDetail = await _movieService.fetchMovieDetail(id);
      _updateState(showLoading: false, movieDetail: movieDetail);
    } catch (e) {
      _updateState(showLoading: false);
    }
  }

  Future<void> loadTrailerList(int id) async {
    try {
      _updateState(showLoading: true);
      final trailers = await _trailerService.fetchTrailers(id);
      if (trailers != null) {
        final result = trailers.results;
        _updateState(showLoading: false, trailers: result);
      }
    } catch (e) {
      _updateState(showLoading: false);
    }
  }

  void _updateState({
    MovieDetail? movieDetail,
    List<Trailer>? trailers,
    bool? showLoading,
  }) async {
    movieDetail ??= value.movieDetail;
    showLoading ??= value.showLoading;
    trailers ??= value.trailers;
    stateData = MovieDetailData(
      showLoading: showLoading,
      movieDetail: movieDetail,
      trailers: trailers,
    );
  }
}
