part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();
}

class VideoInitial extends VideoState {
  @override
  List<Object> get props => [];
}

class VideoLoaded extends VideoState {
  final List<VideoEntity> videoEntity;

  const VideoLoaded({required this.videoEntity});
  @override
  List<Object> get props => [videoEntity];
}

class VideoError extends VideoState {
  @override
  List<Object> get props => [];
}