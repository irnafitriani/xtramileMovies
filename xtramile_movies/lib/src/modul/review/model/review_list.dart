import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xtramile_movies/src/base_class/state_data_model.dart';

part 'review_list.freezed.dart';
part 'review_list.g.dart';

@freezed
class ReviewList extends StateData with _$ReviewList {
  const factory ReviewList({
    bool? showLoading,
    required int? id,
    required int? page,
    required List<Review> results,
    @JsonKey(name: 'total_pages') required int? totalPages,
    @JsonKey(name: 'total_results') required int? totalResults,
  }) = _ReviewList;

  factory ReviewList.fromJson(Map<String, dynamic> json) => _$ReviewListFromJson(json);
}

@freezed
class Review with _$Review {
  const factory Review({
    required String? author,
    @JsonKey(name: 'author_details') required AuthorDetails authorDetails,
    required String? content,
    @JsonKey(name: 'created_at') required String createdAt,
    required String? id,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required String? url,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class AuthorDetails with _$AuthorDetails {
  const factory AuthorDetails({
    required String? name,
    required String? username,
    @JsonKey(name: 'avatar_path') required String? avatarPath,
    required int? rating,
  }) = _AuthorDetails;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => _$AuthorDetailsFromJson(json);
}
