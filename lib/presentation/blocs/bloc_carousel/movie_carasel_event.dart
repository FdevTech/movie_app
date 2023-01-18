part of 'movie_carasel_bloc.dart';

@immutable
abstract class MovieCarouselEvent extends Equatable {
 const MovieCarouselEvent();

 /* @override
  List<Object> get props {
    return [];
  }*/
}

class CarouselLoadEvent extends MovieCarouselEvent {

  final int defaultIndex;

  const CarouselLoadEvent({this.defaultIndex=0});


  @override

  List<Object?> get props => [defaultIndex];


}
