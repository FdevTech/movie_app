

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
part 'cast_crew_result_data_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CastCrewResultModel {
  final int? id;
  final List<CastModel> cast;
  final List<CrewModel> crew;
  CastCrewResultModel(this.id, this.cast, this.crew);
  factory CastCrewResultModel.fromJson(Map<String, dynamic> json) => _$CastCrewResultModelFromJson(json);



  Map<String, dynamic> toJson() => _$CastCrewResultModelToJson(this);
}

@JsonSerializable()
class CastModel
{
  final bool? adult;
  final num? gender,cast_id,popularity;
  final String? known_for_department,original_name,profile_path,character,credit_id;

  CastModel(this.adult,
      this.gender,
      this.cast_id,
      this.popularity,
      this.known_for_department,
      this.original_name,
      this.profile_path,
      this.character,
      this.credit_id);

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);

}

@JsonSerializable()
class CrewModel{
  final bool? adult;
  final num? gender,cast_id,popularity;
  final String? known_for_department,original_name,profile_path,character,credit_id;

  CrewModel(this.adult, this.gender, this.cast_id, this.popularity, this.known_for_department, this.original_name, this.profile_path, this.character, this.credit_id);

  factory CrewModel.fromJson(Map<String, dynamic> json) => _$CrewModelFromJson(json);

  Map<String, dynamic> toJson() => _$CrewModelToJson(this);

}

extension ToCastEntiry on List<CastModel>
{
    List<CastEntity> toCastEntity()
    {
      return map((castModel) {
          return CastEntity(
              creditId: castModel.credit_id??"",
              name: castModel.original_name??"",
              posterPath: castModel.profile_path??"",
              character: castModel.character??"");
      }).toList();
    }
}