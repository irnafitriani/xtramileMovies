// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewListImpl _$$ReviewListImplFromJson(Map<String, dynamic> json) =>
    _$ReviewListImpl(
      showLoading: json['showLoading'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReviewListImplToJson(_$ReviewListImpl instance) =>
    <String, dynamic>{
      'showLoading': instance.showLoading,
      'id': instance.id,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      author: json['author'] as String?,
      authorDetails: AuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String?,
      createdAt: json['created_at'] as String,
      id: json['id'] as String?,
      updatedAt: json['updated_at'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'author_details': instance.authorDetails,
      'content': instance.content,
      'created_at': instance.createdAt,
      'id': instance.id,
      'updated_at': instance.updatedAt,
      'url': instance.url,
    };

_$AuthorDetailsImpl _$$AuthorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AuthorDetailsImpl(
      name: json['name'] as String?,
      username: json['username'] as String?,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AuthorDetailsImplToJson(_$AuthorDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
