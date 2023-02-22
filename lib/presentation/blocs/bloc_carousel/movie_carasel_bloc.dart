

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/no_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_trending.dart';


import '../bloc_backdrop/backdrop_bloc.dart';
part 'movie_carasel_event.dart';
part 'movie_carasel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final BackdropBloc backdropBloc;
  MovieCarouselBloc({required this.getTrending, required this.backdropBloc}) : super(MovieCarouselInitial()) {

    on<CarouselLoadEvent>((event, emit) async{

         final movieEither = await getTrending(NoParams());
         movieEither.fold((l) {
            emit(MovieCarouselError(
              l.appErrorType
            ));
         },
                 (movies) {

                   backdropBloc.add(MovieBackdropChangeEvent(movie: movies[event.defaultIndex]));
                   emit( MovieCarouselLoaded(movies: movies, defaultIndex: event.defaultIndex));
                 });
    });
  }
}
