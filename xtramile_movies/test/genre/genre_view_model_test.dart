import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/modul/genre/service/genre_service.dart';
import 'package:xtramile_movies/src/modul/genre/view_model/genre_view_model.dart';

import '../test_helper.mocks.dart';

void main() {
  final mockGenreService = MockGenreService();
  late GenreViewModel genreViewModel;
  final GetIt getIt = GetIt.instance;

  setUp(() {
    genreViewModel = GenreViewModel(mockGenreService);
  });

  setUpAll(() async {
    getIt.reset();
    getIt.registerSingleton<GenreService>(MockGenreService());
  });

  group(' genre test', () {
    test('loadGenres updates state correctly on success', () async {
      final genres = [
        Genre(id: 1, name: 'Action'),
        Genre(id: 2, name: 'Comedy'),
      ];

      when(mockGenreService.fetchGenres()).thenAnswer((_) async => genres);

      await genreViewModel.loadGenres();

      expect(
        genreViewModel.value,
        GenresResponse(showLoading: false, genres: genres),
      );
      verify(mockGenreService.fetchGenres()).called(1);
    });

    test('loadGenres updates state correctly on failure', () async {
      when(mockGenreService.fetchGenres()).thenThrow(Exception('Failed to load genres'));

      await genreViewModel.loadGenres();

      expect(
        genreViewModel.value,
        GenresResponse(showLoading: false, genres: []),
      );
      verify(mockGenreService.fetchGenres()).called(1);
    });

    test('init calls loadGenres', () async {
      final genres = [
        Genre(id: 1, name: 'Action'),
        Genre(id: 2, name: 'Comedy'),
      ];

      when(mockGenreService.fetchGenres()).thenAnswer((_) async => genres);

      await genreViewModel.init();

      expect(
        genreViewModel.value,
        GenresResponse(showLoading: false, genres: genres),
      );
      verify(mockGenreService.fetchGenres()).called(1);
    });
  });
}
