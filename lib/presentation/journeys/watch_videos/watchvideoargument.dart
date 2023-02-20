import '../../../domain/entities/video_entity.dart';

class WatchVideoArgument{

  final List<VideoEntity> videoEntity;

  const WatchVideoArgument({required this.videoEntity});
}