import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';

import '../../../domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  MovieDetailBloc({required this.getMovieDetail}) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>((event, emit) async {
      final eitherResponse= await getMovieDetail(MovieParams(event.movieId));
      eitherResponse.fold((l) {
         emit(MovieDetailError());
      },
              (movie) {
                emit(MovieDetailLoaded(movieDetailEntity: movie));
              });
    });
  }
}
