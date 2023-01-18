part of 'backdrop_bloc.dart';

abstract class BackdropEvent extends Equatable {
  const BackdropEvent();
}

class MovieBackdropChangeEvent extends BackdropEvent {
  final MovieEntity movie;

  const MovieBackdropChangeEvent({required this.movie});
  @override
  List<Object?> get props => [movie];
}