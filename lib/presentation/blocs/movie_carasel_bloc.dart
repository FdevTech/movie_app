import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/entities/no_params.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/get_trending.dart';
import 'dart:developer' as dev show log;
part 'movie_carasel_event.dart';
part 'movie_carasel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  MovieCarouselBloc({required this.getTrending}) : super(MovieCarouselInitial()) {

    on<CarouselLoadEvent>((event, emit) async{
         dev.log("===carouselLoadEvent=====");
         final movieEither = await getTrending(NoParams());
         movieEither.fold((l) {
            emit(MovieCarouselError());
         },
                 (movies) {
                   dev.log("carouselLoadEvent===${movies.length}");
                   emit( MovieCarouselLoaded(movies: movies, defaultIndex: event.defaultIndex));
                 });
    });
  }
}
