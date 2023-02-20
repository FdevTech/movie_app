import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';

import '../../../domain/usecases/get_movie_detail.dart';
import '../cast_bloc.dart';
import '../videobloc/video_bloc.dart';
import 'dart:developer' as dev show log;

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideoBloc videoBloc;
  MovieDetailBloc({
    required this.getMovieDetail,
    required this.castBloc,
    required this.videoBloc
  }) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>((event, emit) async {
      final eitherResponse= await getMovieDetail(MovieParams(event.movieId));
      dev.log("MovieDetailBloc: movie id ${event.movieId}");
      castBloc.add(LoadCastEvent(movieId: event.movieId));
      videoBloc.add(LoadVideoEvent(movieId: event.movieId));
      eitherResponse.fold((l) {
         emit(MovieDetailError());
      },
              (movie) {

                emit(MovieDetailLoaded(movieDetailEntity: movie));
              });

    });
  }
   @override
  Future<void> close() {
     castBloc.close();
     videoBloc.close();
    return super.close();
  }
}
