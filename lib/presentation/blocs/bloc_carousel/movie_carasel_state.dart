part of 'movie_carasel_bloc.dart';

@immutable
abstract class MovieCarouselState extends Equatable{}

class MovieCarouselInitial extends MovieCarouselState {
  @override
  List<Object?> get props =>[];

}

class MovieCarouselError extends MovieCarouselState{
  @override
  List<Object?> get props =>[];

}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselLoaded({required this.movies, this.defaultIndex=0});

  @override
  List<Object?> get props => [];

}
