
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/video_entity.dart';

import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/getVideos.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideos getVideo;
  VideoBloc({required this.getVideo}) : super(VideoInitial()) {
    on<LoadVideoEvent>((event, emit) async {
       final response = await getVideo(MovieParams(event.movieId)) ;
       response.fold((l) => emit(VideoError()),
               (r) => emit(VideoLoaded(videoEntity: r)));

    });
  }
}
