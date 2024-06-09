import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';

part 'movie_list.freezed.dart';
part 'movie_list.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required bool? adult,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int? id,
    @JsonKey(name: 'original_title') required String? originalTitle,
    required String? overview,
    required double? popularity,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'release_date') required String? releaseDate,
    required String? title,
    required bool? video,
    @JsonKey(name: 'vote_average') required double? voteAverage,
    @JsonKey(name: 'vote_count') required int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

@freezed
class MovieList extends StateData with _$MovieList {
  factory MovieList({
    bool? showLoading,
    required int? page,
    @JsonKey(name: 'total_pages') required int? totalPages,
    @JsonKey(name: 'total_results') required int? totalResults,
    required List<Movie> results,
  }) = _MovieList;

  factory MovieList.fromJson(Map<String, dynamic> json) => _$MovieListFromJson(json);
}
