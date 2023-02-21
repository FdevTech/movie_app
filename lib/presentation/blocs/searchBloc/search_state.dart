part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<MovieEntity> movies;

  const SearchLoaded({required this.movies});
  @override
  List<Object> get props => [movies];
}

class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}