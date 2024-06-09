import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_detail.dart';
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart';
import 'package:xtramile_movies/src/modul/movie/viewmodel/movie_detail_view_model.dart';
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart';
import 'package:xtramile_movies/src/modul/trailer/service/trailer_service.dart';

import '../test_helper.mocks.dart';

void main() {
  final mockMovieService = MockMovieService();
  final mockTrailerService = MockTrailerService();
  late MovieDetailViewModel movieDetailViewModel;
  final GetIt getIt = GetIt.instance;

  setUp(() {
    movieDetailViewModel = MovieDetailViewModel(mockMovieService, mockTrailerService);
  });

  setUpAll(() async {
    getIt.reset();
    getIt.registerSingleton<MovieService>(MockMovieService());
    getIt.registerSingleton<TrailerService>(MockTrailerService());
  });

  group(' movie detail view model test', () {
    test('initial state is correct', () {
      expect(movieDetailViewModel.value,
          const MovieDetailData(showLoading: false, movieDetail: null, trailers: null));
    });

    test('fetchMovieDetail updates state correctly on success', () async {
      final movieJson = {
        "adult": false,
        "backdrop_path": "/xQkotnzv12fm9FF29if1cBLsyU3.jpg",
        "belongs_to_collection": null,
        "budget": 0,
        "genres": [
          {"id": 53, "name": "Thriller"},
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
        ],
        "production_countries": [
          {"iso_3166_1": "FR", "name": "France"}
        ],
        "release_date": "2024-06-05",
        "revenue": 0,
        "runtime": 104,
        "spoken_languages": [
          {"english_name": "French", "iso_639_1": "fr", "name": "Français"},
        ],
        "status": "Released",
        "tagline": "",
        "title": "Under Paris",
        "video": false,
        "vote_average": 5.8,
        "vote_count": 223
      };
      final movieDetail = MovieDetail.fromJson(movieJson);

      when(mockMovieService.fetchMovieDetail(any)).thenAnswer((_) async => movieDetail);

      await movieDetailViewModel.fetchMovieDetail(1);

      expect(
        movieDetailViewModel.value,
        MovieDetailData(showLoading: false, movieDetail: movieDetail, trailers: null),
      );
      verify(mockMovieService.fetchMovieDetail(1)).called(1);
    });

    test('fetchMovieDetail handles error correctly', () async {
      when(mockMovieService.fetchMovieDetail(any))
          .thenThrow(Exception('Failed to load movie detail'));

      await movieDetailViewModel.fetchMovieDetail(1);

      expect(
        movieDetailViewModel.value,
        const MovieDetailData(showLoading: false, movieDetail: null, trailers: null),
      );
      verify(mockMovieService.fetchMovieDetail(1)).called(1);
    });

    test('loadTrailerList updates state correctly on success', () async {
      final trailerJson = {
        "id": 929590,
        "results": [
          {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "So Other People Ask - Official Clip",
            "key": "Xl2KQIpvd6Y",
            "site": "YouTube",
            "size": 1080,
            "type": "Clip",
            "official": true,
            "published_at": "2024-05-31T20:00:12.000Z",
            "id": "665c9f7ce73cdcf11dab14a0"
          },
        ],
      };
      final trailerList = TrailerList.fromJson(trailerJson);

      when(mockTrailerService.fetchTrailers(any)).thenAnswer((_) async => trailerList);

      await movieDetailViewModel.loadTrailerList(1);

      expect(movieDetailViewModel.value.trailers?.length, trailerList.results.length);
      verify(mockTrailerService.fetchTrailers(1)).called(1);
    });

    test('loadTrailerList handles error correctly', () async {
      when(mockTrailerService.fetchTrailers(any)).thenThrow(Exception('Failed to load trailers'));

      await movieDetailViewModel.loadTrailerList(1);

      expect(
        movieDetailViewModel.value,
        const MovieDetailData(showLoading: false, movieDetail: null, trailers: null),
      );
      verify(mockTrailerService.fetchTrailers(1)).called(1);
    });

    test('init calls fetchMovieDetail and loadTrailerList', () async {
      final movieJson = {
        "adult": false,
        "backdrop_path": "/xQkotnzv12fm9FF29if1cBLsyU3.jpg",
        "belongs_to_collection": null,
        "budget": 0,
        "genres": [
          {"id": 53, "name": "Thriller"},
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
        ],
        "production_countries": [
          {"iso_3166_1": "FR", "name": "France"}
        ],
        "release_date": "2024-06-05",
        "revenue": 0,
        "runtime": 104,
        "spoken_languages": [
          {"english_name": "French", "iso_639_1": "fr", "name": "Français"},
        ],
        "status": "Released",
        "tagline": "",
        "title": "Under Paris",
        "video": false,
        "vote_average": 5.8,
        "vote_count": 223
      };
      final movieDetail = MovieDetail.fromJson(movieJson);
      final trailerJson = {
        "id": 929590,
        "results": [
          {
            "iso_639_1": "en",
            "iso_3166_1": "US",
            "name": "So Other People Ask - Official Clip",
            "key": "Xl2KQIpvd6Y",
            "site": "YouTube",
            "size": 1080,
            "type": "Clip",
            "official": true,
            "published_at": "2024-05-31T20:00:12.000Z",
            "id": "665c9f7ce73cdcf11dab14a0"
          },
        ],
      };
      final trailerList = TrailerList.fromJson(trailerJson);

      when(mockMovieService.fetchMovieDetail(any)).thenAnswer((_) async => movieDetail);
      when(mockTrailerService.fetchTrailers(any)).thenAnswer((_) async => trailerList);

      await movieDetailViewModel.init(1);

      verify(mockMovieService.fetchMovieDetail(1)).called(1);
      verify(mockTrailerService.fetchTrailers(1)).called(1);

      expect(
        movieDetailViewModel.value.movieDetail?.id,
        movieDetail.id,
      );
    });
  });
}
