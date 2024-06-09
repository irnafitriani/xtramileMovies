import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/modul/genre/service/genre_service.dart';
import 'package:xtramile_movies/src/network/model/network_response_model.dart';

import '../test_helper.mocks.dart';

void main() {
  late GenreServiceeImpl genreService;
  final mockNetworkService = MockNetworkService();

  setUp(() {
    genreService = GenreServiceeImpl(mockNetworkService);
  });

  group('fetchGenres', () {
    test('returns genres when the network call is successful', () async {
      final Map<String, dynamic> response = {
        "genres": [
          {"id": 28, "name": "Action"},
          {"id": 12, "name": "Adventure"},
        ]
      };

      when(mockNetworkService.request(any, any))
          .thenAnswer((_) async => NetworkResponse<Map<String, dynamic>>.ok(response));

      final genres = await genreService.fetchGenres();

      expect(genres, isA<List<Genre>>());
      expect(genres.length, 2);
    });

    test('returns empty list when the network call returns no data', () async {
      when(mockNetworkService.request(any, any)).thenAnswer(
          (_) async => const NetworkResponse<Map<String, dynamic>>.noData('No data available'));

      final genres = await genreService.fetchGenres();

      expect(genres, isEmpty);
    });

    test('returns empty list when the network call fails with or else', () async {
      when(mockNetworkService.request(any, any)).thenAnswer(
          (_) async => const NetworkResponse<Map<String, dynamic>>.noAccess('No Access'));

      final genres = await genreService.fetchGenres();

      expect(genres, isEmpty);
    });

    test('throws an exception when the network call throws an error', () async {
      when(mockNetworkService.request(any, any)).thenThrow(Exception('Network error'));

      expect(() => genreService.fetchGenres(), throwsException);
    });
  });
}
