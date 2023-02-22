part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class IsFavoriteState extends FavoriteState {
  final bool isFav;

  const IsFavoriteState({required this.isFav});

  @override
  List<Object?> get props => [isFav];

}

class UnFavoriteState extends FavoriteState {
  final bool isDeleted;

  const UnFavoriteState({required this.isDeleted});

  @override
  List<Object?> get props => [isDeleted];
}

class GetAllFavoriteState extends FavoriteState {
  final List<FavEntity> faavorites;

  const GetAllFavoriteState({required this.faavorites});

  @override
  List<Object?> get props => [faavorites];
}

class FavoriteStateError extends FavoriteState {
  @override
  List<Object?> get props => [];

}