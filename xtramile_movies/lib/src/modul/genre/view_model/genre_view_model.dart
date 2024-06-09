import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/base_class/view_model.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/modul/genre/service/genre_service.dart';

@injectable
class GenreViewModel extends ViewModel<GenresResponse> {
  GenreViewModel(this._genreService) : super(GenresResponse(showLoading: false, genres: []));
  final GenreService _genreService;

  init() async {
    await loadGenres();
  }

  Future<void> loadGenres() async {
    _updateState(showLoading: true);
    try {
      final genres = await _genreService.fetchGenres();
      _updateState(showLoading: false, genres: genres);
    } catch (e) {
      _updateState(showLoading: false);
    }
  }

  void _updateState({
    List<Genre>? genres,
    bool? showLoading,
  }) async {
    genres ??= value.genres;
    showLoading ??= value.showLoading;
    stateData = GenresResponse(
      showLoading: showLoading,
      genres: genres,
    );
  }
}
