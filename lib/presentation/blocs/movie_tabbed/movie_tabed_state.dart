part of 'movie_tabed_bloc.dart';

abstract class MovieTabState extends Equatable {
 final int currentTabIndex;
  const MovieTabState({this.currentTabIndex=0});
}

class MovieTabInitialState extends MovieTabState {


  const MovieTabInitialState();

  @override
  List<Object> get props => [];
}

class MovieTabChangedState extends MovieTabState {
  final List<MovieEntity> movies;

  const MovieTabChangedState({required this.movies, int currentIndex=0}):super(currentTabIndex: currentIndex);

  @override
  List<Object?> get props =>[movies];
}

class MovieTabErrorState extends MovieTabState
{
  const MovieTabErrorState(int currentIndex):super(currentTabIndex:currentIndex);
  @override
  List<Object?> get props => [];

}