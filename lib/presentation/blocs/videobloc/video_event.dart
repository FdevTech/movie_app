part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();
}

class LoadVideoEvent extends VideoEvent {
  final int movieId;

  const LoadVideoEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];

}