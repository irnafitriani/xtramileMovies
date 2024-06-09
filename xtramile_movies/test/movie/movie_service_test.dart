import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_detail.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_list.dart';
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart';
import 'package:xtramile_movies/src/network/model/network_response_model.dart';

import '../test_helper.mocks.dart';

void main() {
  late MovieServiceImpl movieService;
  final mockNetworkService = MockNetworkService();

  setUp(() {
    movieService = MovieServiceImpl(mockNetworkService);
  });

  group('movie service test ', () {
    test('returns movies when the network call is successful', () async {
      final Map<String, dynamic> response = {
        "page": 1,
        "results": [
          {
            "adult": false,
            "backdrop_path": "/fqv8v6AycXKsivp1T5yKtLbGXce.jpg",
            "genre_ids": [878, 12, 28],
            "id": 653346,
            "original_language": "en",
            "original_title": "Kingdom of the Planet of the Apes",
            "overview":
                "Several generations in the future following Caesar's reign, apes are now the dominant species and live harmoniously while humans have been reduced to living in the shadows. As a new tyrannical ape leader builds his empire, one young ape undertakes a harrowing journey that will cause him to question all that he has known about the past and to make choices that will define a future for apes and humans alike.",
            "popularity": 5120.32,
            "poster_path": "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
            "release_date": "2024-05-08",
            "title": "Kingdom of the Planet of the Apes",
            "video": false,
            "vote_average": 6.884,
            "vote_count": 842
          },
        ],
        "total_pages": 2006,
        "total_results": 40106
      };

      when(mockNetworkService.request(any, any))
          .thenAnswer((_) async => NetworkResponse<Map<String, dynamic>>.ok(response));

      final movieList = await movieService.fetchMoviesByGenre('28');

      expect(movieList, isA<MovieList>());
      expect(movieList!.results.length, 1);
    });

    test('returns null when the network call returns no data', () async {
      when(mockNetworkService.request(any, any)).thenAnswer(
          (_) async => const NetworkResponse<Map<String, dynamic>>.noData('no data available'));

      final movieList = await movieService.fetchMoviesByGenre('28');

      expect(movieList, isNull);
    });

    test('throws an exception when the network call throws an error', () async {
      when(mockNetworkService.request(any, any)).thenThrow(Exception('Network error'));

      expect(() => movieService.fetchMoviesByGenre('28'), throwsException);
    });
  });

  group('fetchMovieDetail', () {
    test('returns movie detail when the network call is successful', () async {
      final Map<String, dynamic> response = {
        "adult": false,
        "backdrop_path": "/xQkotnzv12fm9FF29if1cBLsyU3.jpg",
        "belongs_to_collection": null,
        "budget": 0,
        "genres": [
          {"id": 53, "name": "Thriller"},
          {"id": 27, "name": "Horror"},
          {"id": 28, "name": "Action"},
          {"id": 9648, "name": "Mystery"}
        ],
        "homepage": "https://www.netflix.com/title/81210788",
        "id": 1001311,
        "imdb_id": "tt13964390",
        "origin_country": ["FR"],
        "original_language": "fr",
        "original_title": "Sous la Seine",
        "overview":
            "In the Summer of 2024, Paris is hosting the World Triathlon Championships on the Seine for the first time. Sophia, a brilliant scientist, learns from Mika, a young environmental activist, that a large shark is swimming deep in the river. To avoid a bloodbath at the heart of the city, they have no choice but to join forces with Adil, the Seine river police commander.",
        "popularity": 435.61,
        "poster_path": "/qZPLK5ktRKa3CL4sKRZtj8UlPYc.jpg",
        "production_companies": [
          {"id": 195537, "logo_path": null, "name": "Full Players", "origin_country": "FR"},
          {"id": 220755, "logo_path": null, "name": "Let Me Be", "origin_country": "FR"}
        ],
        "production_countries": [
          {"iso_3166_1": "FR", "name": "France"}
        ],
        "release_date": "2024-06-05",
        "revenue": 0,
        "runtime": 104,
        "spoken_languages": [
          {"english_name": "French", "iso_639_1": "fr", "name": "Français"},
          {"english_name": "Russian", "iso_639_1": "ru", "name": "Pусский"}
        ],
        "status": "Released",
        "tagline": "",
        "title": "Under Paris",
        "video": false,
        "vote_average": 5.8,
        "vote_count": 223
      };

      when(mockNetworkService.request(any, any))
          .thenAnswer((_) async => NetworkResponse<Map<String, dynamic>>.ok(response));

      final movieDetail = await movieService.fetchMovieDetail(1);

      expect(movieDetail, isA<MovieDetail>());
      expect(movieDetail?.title, 'Under Paris');
    });

    test('returns null when the network call returns or else', () async {
      when(mockNetworkService.request(any, any)).thenAnswer(
          (_) async => const NetworkResponse<Map<String, dynamic>>.noAccess('no access'));

      final movieDetail = await movieService.fetchMovieDetail(1);

      expect(movieDetail, isNull);
    });

    test('throws an exception when the network call throws an error', () async {
      when(mockNetworkService.request(any, any)).thenThrow(Exception('Network error'));

      expect(() => movieService.fetchMovieDetail(1), throwsException);
    });
  });
}
