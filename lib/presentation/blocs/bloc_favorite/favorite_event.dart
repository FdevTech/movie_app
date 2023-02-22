part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}


class AddToFavoriteEvent extends FavoriteEvent
{
   final MovieDetailEntity movieEntity;
   const AddToFavoriteEvent({required this.movieEntity});

  @override
  List<Object?> get props => [movieEntity];

}

class IsFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const IsFavoriteEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

class UnFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const UnFavoriteEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

class AllFavoriteEvent extends FavoriteEvent {

  const AllFavoriteEvent();

  @override
  List<Object?> get props => [];
}