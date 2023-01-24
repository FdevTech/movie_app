part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState
{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class MovieDetailError extends MovieDetailState
{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class MovieDetailLoaded extends MovieDetailState
{
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailLoaded({required this.movieDetailEntity});
  @override
  List<Object?> get props => [movieDetailEntity];

}