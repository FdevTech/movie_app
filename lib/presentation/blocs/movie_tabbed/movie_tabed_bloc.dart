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

import 'dart:developer' as dev show log;
part 'movie_tabed_event.dart';
part 'movie_tabed_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabBloc({
    required this.getPlayingNow,
    required this.getPopular,
    required this.getComingSoon}) : super(const MovieTabInitialState()) {
    on<MovieTabChangedEvent>((event, emit) async {
      Either<AppError, List<MovieEntity>> movieEither;
      dev.log("currentTabIndex:=>${event.currentTabIndex}");
      switch(event.currentTabIndex)
      {

        case 0:
          movieEither = await getPopular(NoParams());
          break;
        case 1:
          movieEither = await getPlayingNow(NoParams());
          break;
        case 2:
          movieEither = await getComingSoon(NoParams());
          break;
        default:
          movieEither=  await getPopular(NoParams());
      }
      movieEither.fold((error) {
         emit(MovieTabErrorState(event.currentTabIndex,appErrorType: error.appErrorType));
      },
              (movies) {
                dev.log("fold right=> ${movies.length}");
                emit(MovieTabChangedState(movies: movies,currentIndex: event.currentTabIndex));

              });
    });
  }
}
