import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';

part 'trailer.freezed.dart';
part 'trailer.g.dart';


@freezed
class TrailerList extends StateData with _$TrailerList {
  const factory TrailerList({
    bool? showLoading,
    required int? id,
    required List<Trailer> results,
  }) = _TrailerList;

  factory TrailerList.fromJson(Map<String, dynamic> json) => _$TrailerListFromJson(json);
}

@freezed
class Trailer with _$Trailer {
  const factory Trailer({
    @JsonKey(name: 'iso_639_1') required String? iso6391,
    @JsonKey(name: 'iso_3166_1')required String? iso31661,
    required String? name,
    required String? key,
    required String? site,
    required int? size,
    required String? type,
    required bool? official,
    @JsonKey(name: 'published_at') required String? publishedAt,
    required String id,
  }) = _Trailer;

  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);
}
