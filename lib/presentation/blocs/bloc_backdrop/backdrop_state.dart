part of 'backdrop_bloc.dart';

abstract class BackdropState extends Equatable {
  const BackdropState();
}

class MovieBackdropInitialState extends BackdropState {
  @override
  List<Object> get props => [];
}

class MovieBackdropChangeState extends BackdropState {
  final MovieEntity movieEntity;

  const MovieBackdropChangeState({required this.movieEntity});
  @override
  List<Object?> get props => [movieEntity];

}