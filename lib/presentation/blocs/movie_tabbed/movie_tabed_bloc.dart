import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_comming_soon.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabed_event.dart';
part 'movie_tabed_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  late final Either<AppError, List<MovieEntity>> _movieEither;
  MovieTabBloc({
    required this.getPlayingNow,
    required this.getPopular,
    required this.getComingSoon}) : super(const MovieTabInitialState()) {
    on<MovieTabChangedEvent>((event, emit) async {

      switch(event.currentTabIndex)
      {
        case 0:
          _movieEither = await getPopular(NoParams());
          break;
        case 1:
          _movieEither = await getPlayingNow(NoParams());
          break;
        case 2:
           _movieEither = await getComingSoon(NoParams());
      }
      _movieEither.fold((movies) {
         emit(MovieTabErrorState(event.currentTabIndex));
      },
              (movies) {
                emit(MovieTabChangedState(movies: movies));

              });
    });
  }
}
