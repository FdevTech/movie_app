import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

part 'backdrop_event.dart';
part 'backdrop_state.dart';

class BackdropBloc extends Bloc<BackdropEvent, BackdropState> {
  BackdropBloc() : super(MovieBackdropInitialState()) {
    on<MovieBackdropChangeEvent>((event, emit) {
      emit(MovieBackdropChangeState(movieEntity: event.movie));
    });
  }
}
