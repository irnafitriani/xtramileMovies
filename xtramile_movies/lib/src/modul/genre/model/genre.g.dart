// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$GenresResponseImpl _$$GenresResponseImplFromJson(Map<String, dynamic> json) =>
    _$GenresResponseImpl(
      showLoading: json['showLoading'] as bool?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenresResponseImplToJson(
        _$GenresResponseImpl instance) =>
    <String, dynamic>{
      'showLoading': instance.showLoading,
      'genres': instance.genres,
    };
