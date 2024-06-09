import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class Genre with _$Genre {
  factory Genre({
    required int? id,
    required String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class GenresResponse extends StateData with _$GenresResponse {
  factory GenresResponse({
    bool? showLoading,
    required List<Genre> genres,
  }) = _GenresResponse;

  factory GenresResponse.fromJson(Map<String, dynamic> json) => _$GenresResponseFromJson(json);
}
