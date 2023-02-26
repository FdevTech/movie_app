// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      json['id'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => VideoItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

VideoItemModel _$VideoItemModelFromJson(Map<String, dynamic> json) =>
    VideoItemModel(
      json['iso_639_1'] as String?,
      json['iso_3166_1'] as String?,
      json['name'] as String?,
      json['key'] as String?,
      json['site'] as String?,
      json['type'] as String?,
      json['published_at'] as String?,
      json['id'] as String?,
      json['official'] as bool?,
      json['size'] as int?,
    );

Map<String, dynamic> _$VideoItemModelToJson(VideoItemModel instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'published_at': instance.published_at,
      'id': instance.id,
      'official': instance.official,
      'size': instance.size,
    };
