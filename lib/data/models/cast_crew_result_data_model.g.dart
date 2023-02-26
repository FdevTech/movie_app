// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_crew_result_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastCrewResultModel _$CastCrewResultModelFromJson(Map<String, dynamic> json) =>
    CastCrewResultModel(
      json['id'] as int?,
      (json['cast'] as List<dynamic>)
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CastCrewResultModelToJson(
        CastCrewResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      json['adult'] as bool?,
      json['gender'] as num?,
      json['cast_id'] as num?,
      json['popularity'] as num?,
      json['known_for_department'] as String?,
      json['original_name'] as String?,
      json['profile_path'] as String?,
      json['character'] as String?,
      json['credit_id'] as String?,
    );

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'cast_id': instance.cast_id,
      'popularity': instance.popularity,
      'known_for_department': instance.known_for_department,
      'original_name': instance.original_name,
      'profile_path': instance.profile_path,
      'character': instance.character,
      'credit_id': instance.credit_id,
    };

CrewModel _$CrewModelFromJson(Map<String, dynamic> json) => CrewModel(
      json['adult'] as bool?,
      json['gender'] as num?,
      json['cast_id'] as num?,
      json['popularity'] as num?,
      json['known_for_department'] as String?,
      json['original_name'] as String?,
      json['profile_path'] as String?,
      json['character'] as String?,
      json['credit_id'] as String?,
    );

Map<String, dynamic> _$CrewModelToJson(CrewModel instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'cast_id': instance.cast_id,
      'popularity': instance.popularity,
      'known_for_department': instance.known_for_department,
      'original_name': instance.original_name,
      'profile_path': instance.profile_path,
      'character': instance.character,
      'credit_id': instance.credit_id,
    };
