import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
  final String posterPath;
  final int id;
  final String? backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity(
      {required this.posterPath,
      required this.id,
      this.backdropPath=null,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      required this.overview});

  @override

  List<Object?> get props => [id, title];

}