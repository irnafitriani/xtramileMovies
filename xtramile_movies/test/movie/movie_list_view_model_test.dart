import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:xtramile_movies/src/modul/movie/model/movie_list.dart';
import 'package:xtramile_movies/src/modul/movie/service/movie_service.dart';
import 'package:xtramile_movies/src/modul/movie/viewmodel/movie_list_view_model.dart';

import '../test_helper.mocks.dart';

void main() {
  final mockMovieService = MockMovieService();
  late MovieListViewModel movieListViewModel;
  final GetIt getIt = GetIt.instance;

  setUp(() {
    movieListViewModel = MovieListViewModel(mockMovieService);
  });

  setUpAll(() async {
    getIt.reset();
    getIt.registerSingleton<MovieService>(MockMovieService());
  });

  group(' movie list view model test', () {
    test('initial state is correct', () {
      expect(
          movieListViewModel.value,
          MovieList(
              showLoading: false, page: 0, results: [], totalPages: null, totalResults: null));
    });

    test('loadMovieListByGenreId updates state correctly on success', () async {
      final json = {
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
          {
            "adult": false,
            "backdrop_path": "/z121dSTR7PY9KxKuvwiIFSYW8cf.jpg",
            "genre_ids": [10752, 28, 18],
            "id": 929590,
            "original_language": "en",
            "original_title": "Civil War",
            "overview":
                "In the near future, a group of war journalists attempt to survive while reporting the truth as the United States stands on the brink of civil war.",
            "popularity": 2378.848,
            "poster_path": "/sh7Rg8Er3tFcN9BpKIPOMvALgZd.jpg",
            "release_date": "2024-04-10",
            "title": "Civil War",
            "video": false,
            "vote_average": 7.068,
            "vote_count": 1368
          },
          {
            "adult": false,
            "backdrop_path": "/xRd1eJIDe7JHO5u4gtEYwGn5wtf.jpg",
            "genre_ids": [878, 28, 12],
            "id": 823464,
            "original_language": "en",
            "original_title": "Godzilla x Kong: The New Empire",
            "overview":
                "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.",
            "popularity": 2222.6,
            "poster_path": "/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg",
            "release_date": "2024-03-27",
            "title": "Godzilla x Kong: The New Empire",
            "video": false,
            "vote_average": 7.225,
            "vote_count": 2580
          },
          {
            "adult": false,
            "backdrop_path": "/JtN7Q03S3oq7A4KZ7Z3I7m3osP.jpg",
            "genre_ids": [28, 80, 53],
            "id": 573435,
            "original_language": "en",
            "original_title": "Bad Boys: Ride or Die",
            "overview":
                "After their late former Captain is framed, Lowrey and Burnett try to clear his name, only to end up on the run themselves.",
            "popularity": 1776.083,
            "poster_path": "/nP6RliHjxsz4irTKsxe8FRhKZYl.jpg",
            "release_date": "2024-06-05",
            "title": "Bad Boys: Ride or Die",
            "video": false,
            "vote_average": 7.6,
            "vote_count": 88
          },
          {
            "adult": false,
            "backdrop_path": "/3TNSoa0UHGEzEz5ndXGjJVKo8RJ.jpg",
            "genre_ids": [878, 28],
            "id": 614933,
            "original_language": "en",
            "original_title": "Atlas",
            "overview":
                "A brilliant counterterrorism analyst with a deep distrust of AI discovers it might be her only hope when a mission to capture a renegade robot goes awry.",
            "popularity": 1520.349,
            "poster_path": "/bcM2Tl5HlsvPBnL8DKP9Ie6vU4r.jpg",
            "release_date": "2024-05-23",
            "title": "Atlas",
            "video": false,
            "vote_average": 6.7,
            "vote_count": 646
          },
          {
            "adult": false,
            "backdrop_path": "/H5HjE7Xb9N09rbWn1zBfxgI8uz.jpg",
            "genre_ids": [28, 35],
            "id": 746036,
            "original_language": "en",
            "original_title": "The Fall Guy",
            "overview":
                "Fresh off an almost career-ending accident, stuntman Colt Seavers has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job.",
            "popularity": 1274.542,
            "poster_path": "/tSz1qsmSJon0rqjHBxXZmrotuse.jpg",
            "release_date": "2024-04-24",
            "title": "The Fall Guy",
            "video": false,
            "vote_average": 7.271,
            "vote_count": 1091
          },
          {
            "adult": false,
            "backdrop_path": "/kYgQzzjNis5jJalYtIHgrom0gOx.jpg",
            "genre_ids": [16, 28, 10751, 35, 14],
            "id": 1011985,
            "original_language": "en",
            "original_title": "Kung Fu Panda 4",
            "overview":
                "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
            "popularity": 901.185,
            "poster_path": "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
            "release_date": "2024-03-02",
            "title": "Kung Fu Panda 4",
            "video": false,
            "vote_average": 7.126,
            "vote_count": 1916
          },
          {
            "adult": false,
            "backdrop_path": "/shrwC6U8Bkst9T9J7fr1A50n6x6.jpg",
            "genre_ids": [28, 12, 878],
            "id": 786892,
            "original_language": "en",
            "original_title": "Furiosa: A Mad Max Saga",
            "overview":
                "As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Citadel presided over by The Immortan Joe. While the two Tyrants war for dominance, Furiosa must survive many trials as she puts together the means to find her way home.",
            "popularity": 895.503,
            "poster_path": "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
            "release_date": "2024-05-22",
            "title": "Furiosa: A Mad Max Saga",
            "video": false,
            "vote_average": 7.694,
            "vote_count": 771
          },
          {
            "adult": false,
            "backdrop_path": "/fY3lD0jM5AoHJMunjGWqJ0hRteI.jpg",
            "genre_ids": [878, 27, 28],
            "id": 940721,
            "original_language": "ja",
            "original_title": "ゴジラ-1.0",
            "overview":
                "In postwar Japan, Godzilla brings new devastation to an already scorched landscape. With no military intervention or government help in sight, the survivors must join together in the face of despair and fight back against an unrelenting horror.",
            "popularity": 842.99,
            "poster_path": "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
            "release_date": "2023-11-03",
            "title": "Godzilla Minus One",
            "video": false,
            "vote_average": 7.641,
            "vote_count": 1549
          },
        ],
        "total_pages": 2006,
        "total_results": 40106
      };
      final movies = MovieList.fromJson(json);
      when(mockMovieService.fetchMoviesByGenre(any, page: 1)).thenAnswer((_) async => movies);

      await movieListViewModel.loadMovieListByGenreId('1', reset: true);

      expect(
        movieListViewModel.value.results.length,
        movies.results.length,
      );
      verify(mockMovieService.fetchMoviesByGenre('1', page: 1)).called(1);
    });

    test('loadMovieListByGenreId handles error correctly', () async {
      when(mockMovieService.fetchMoviesByGenre(any, page: 1))
          .thenThrow(Exception('Failed to load movies'));

      await movieListViewModel.loadMovieListByGenreId('1', reset: true);

      expect(
        movieListViewModel.value,
        MovieList(showLoading: false, page: 0, results: [], totalPages: null, totalResults: null),
      );
      verify(mockMovieService.fetchMoviesByGenre('1', page: 1)).called(1);
    });

    test('fetchMoreMovies loads additional movies correctly', () async {
      final firstMovie = {
        "adult": false,
        "backdrop_path": "/kYgQzzjNis5jJalYtIHgrom0gOx.jpg",
        "genre_ids": [16, 28, 10751, 35, 14],
        "id": 1011985,
        "original_language": "en",
        "original_title": "Kung Fu Panda 4",
        "overview":
            "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
        "popularity": 901.185,
        "poster_path": "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
        "release_date": "2024-03-02",
        "title": "Kung Fu Panda 4",
        "video": false,
        "vote_average": 7.126,
        "vote_count": 1916
      };

      final secondMovie = {
        "adult": false,
        "backdrop_path": "/fY3lD0jM5AoHJMunjGWqJ0hRteI.jpg",
        "genre_ids": [878, 27, 28],
        "id": 940721,
        "original_language": "ja",
        "original_title": "ゴジラ-1.0",
        "overview":
            "In postwar Japan, Godzilla brings new devastation to an already scorched landscape. With no military intervention or government help in sight, the survivors must join together in the face of despair and fight back against an unrelenting horror.",
        "popularity": 842.99,
        "poster_path": "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
        "release_date": "2023-11-03",
        "title": "Godzilla Minus One",
        "video": false,
        "vote_average": 7.641,
        "vote_count": 1549
      };
      final firstPageMovies = MovieList(
        showLoading: false,
        page: 1,
        results: [Movie.fromJson(firstMovie)],
        totalPages: 2,
        totalResults: 2,
      );

      final secondPageMovies = MovieList(
        showLoading: false,
        page: 2,
        results: [Movie.fromJson(secondMovie)],
        totalPages: 2,
        totalResults: 2,
      );

      when(mockMovieService.fetchMoviesByGenre(any, page: 1))
          .thenAnswer((_) async => firstPageMovies);
      when(mockMovieService.fetchMoviesByGenre(any, page: 2))
          .thenAnswer((_) async => secondPageMovies);

      await movieListViewModel.loadMovieListByGenreId('1', reset: true);

      await movieListViewModel.fetchMoreMovies('1');

      expect(movieListViewModel.value.results.length, 2);

      verify(mockMovieService.fetchMoviesByGenre('1', page: 1)).called(1);
      verify(mockMovieService.fetchMoviesByGenre('1', page: 2)).called(1);
    });
  });
}
