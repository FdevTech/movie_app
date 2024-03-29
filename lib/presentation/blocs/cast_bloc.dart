
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/app_erro.dart';

import '../../domain/entities/cast_entity.dart';
import '../../domain/entities/movie_params.dart';
import '../../domain/usecases/getCast.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCast;
  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<LoadCastEvent>((event, emit) async {

      Either<AppError,List<CastEntity>> eitherResponse = await getCast(MovieParams(event.movieId));
      eitherResponse.fold((l) => emit(CastError()), (r) => emit(CastLoaded(casts: r)));
    });
  }
}
