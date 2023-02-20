import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/video_entity.dart';
part 'movie_model.g.dart';
@JsonSerializable(explicitToJson: true)
class VideoModel{
  final int? id;
  final List<VideoItemModel>? results;

  VideoModel(this.id, this.results);

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

@JsonSerializable()
class VideoItemModel {
  final String? iso_639_1,iso_3166_1,name,key,site,type,published_at,id;
  final bool? official;
  final int? size;

  VideoItemModel(this.iso_639_1, this.iso_3166_1, this.name, this.key, this.site, this.type, this.published_at, this.id, this.official, this.size);

  factory VideoItemModel.fromJson(Map<String,dynamic> json) => _$VideoItemModelFromJson(json);

  Map<String,dynamic> toJson()=>_$VideoItemModelToJson(this);

}

extension VideoItemModelToVideoEntity on List<VideoItemModel>{

  List<VideoEntity> toVideoEntity()
  {
    return map((videoItemModel) => VideoEntity(
        name: videoItemModel.name??"",
        type: videoItemModel.type??"",
        key: videoItemModel.key??"",
        id: videoItemModel.id??"")).toList();
  }
}