import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xtramile_movies/src/modul/genre/model/genre.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';
import 'package:xtramile_movies/src/modul/trailer/model/trailer.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  factory MovieDetail({
    required bool? adult,
    @JsonKey(name: 'backdrop_path') required String? backdropPath,
    required int? budget,
    required List<Genre> genres,
    required String? homepage,
    required int? id,
    @JsonKey(name: 'imdb_id') required String? imdbId,
    @JsonKey(name: 'origin_country') required List<String> originCountry,
    @JsonKey(name: 'original_language') required String? originalLanguage,
    @JsonKey(name: 'original_title') required String? originalTitle,
    required String? overview,
    required double? popularity,
    @JsonKey(name: 'poster_path') required String? posterPath,
    @JsonKey(name: 'production_companies') required List<ProductionCompany> productionCompanies,
    @JsonKey(name: 'production_countries') required List<Map<String, dynamic>> productionCountries,
    @JsonKey(name: 'release_date') required String? releaseDate,
    required int? revenue,
    required int? runtime,
    @JsonKey(name: 'spoken_languages') required List<Map<String, dynamic>> spokenLanguages,
    required String? status,
    required String? tagline,
    required String? title,
    required bool? video,
    @JsonKey(name: 'vote_average') required double? voteAverage,
    @JsonKey(name: 'vote_count') required int? voteCount,
  }) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  factory ProductionCompany({
    required int? id,
    @JsonKey(name: 'logo_path') required String? logoPath,
    required String? name,
    @JsonKey(name: 'origin_country') required String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class MovieDetailData extends StateData with _$MovieDetailData {
  const factory MovieDetailData({
    required bool? showLoading,
    required MovieDetail? movieDetail,
    required List<Trailer>? trailers,
  }) = _MovieDetailData;
}
