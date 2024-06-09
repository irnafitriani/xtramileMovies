import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_list.dart';
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart';

@injectable
class MovieListViewModel extends ViewModel<MovieList> {
  MovieListViewModel(this._movieService)
      : super(
          MovieList(
            showLoading: false,
            page: 0,
            results: [],
            totalPages: null,
            totalResults: null,
          ),
        );

  final MovieService _movieService;
  bool _isLoadingMore = false;

  void init(String genreId) async {
    await loadMovieListByGenreId(genreId, reset: true);
  }

  Future<void> loadMovieListByGenreId(String id, {bool reset = false}) async {
    if (reset) {
      _updateState(showLoading: true, movies: [], page: 0, totalPages: null, totalResults: null);
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
      final movies = await _movieService.fetchMoviesByGenre(id, page: currentPage);
      if (movies != null) {
        final resultMovies = movies.results;
        final updatedMovies = List<Movie>.from(value.results)..addAll(resultMovies);
        _updateState(
          showLoading: false,
          movies: updatedMovies,
          page: movies.page,
          totalPages: movies.totalPages,
          totalResults: movies.totalResults,
        );
      }
    } catch (e) {
      _updateState(showLoading: false);
    } finally {
      _isLoadingMore = false;
    }
  }

  void _updateState({
    List<Movie>? movies,
    bool? showLoading,
    int? page,
    int? totalPages,
    int? totalResults,
  }) {
    stateData = MovieList(
      showLoading: showLoading ?? value.showLoading,
      results: movies ?? value.results,
      page: page ?? value.page,
      totalPages: totalPages ?? value.totalPages,
      totalResults: totalResults ?? value.totalResults,
    );
  }

  Future<void> fetchMoreMovies(String genreId) async {
    await loadMovieListByGenreId(genreId);
  }
}
