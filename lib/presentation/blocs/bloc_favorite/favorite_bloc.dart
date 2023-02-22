import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/local/fav_entity.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';


import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/usecase.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final UseCase<List<FavEntity>,NoParams> allFavoriteUseCase;
  final UseCase<bool,MovieDetailEntity> addFavoriteUseCase;
  final UseCase<bool,int> isFavUseCase;
  final UseCase<bool,int> unFavUseCase ;
  FavoriteBloc({
     required this.addFavoriteUseCase,
     required this.allFavoriteUseCase,
     required this.isFavUseCase,
     required this.unFavUseCase
}) : super(FavoriteInitial()) {
    on<AllFavoriteEvent>((event, emit) async {

       final results = await allFavoriteUseCase(NoParams());
       results.fold(
               (l) => emit(FavoriteStateError()),
               (r) => emit(GetAllFavoriteState(faavorites: r)));

    });
    on<IsFavoriteEvent>((event, emit) async {

      final results = await isFavUseCase(event.movieId);

      results.fold((l) => emit(FavoriteStateError()),
              (r) => emit(IsFavoriteState(isFav: r)));

    });
    on<AddToFavoriteEvent>((event, emit) async {
      final result = await addFavoriteUseCase(event.movieEntity);
      result.fold((l) => emit(FavoriteStateError()), (r) {

        emit(IsFavoriteState(isFav: r));
      });
    });

    on<UnFavoriteEvent>((event, emit) async {
      final results = await unFavUseCase(event.movieId);
      results.fold((l) => emit(FavoriteStateError()), (r) => emit(UnFavoriteState(isDeleted: r)));
    });

  }
}
