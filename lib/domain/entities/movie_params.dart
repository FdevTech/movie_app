import 'package:equatable/equatable.dart';

class MovieParams extends Equatable
{
  final int id;

  const MovieParams(this.id);
  @override
  List<Object?> get props => [id];

}



class SearchParams extends Equatable {
  final String query;

  const SearchParams(this.query);

  @override
  List<Object?> get props => [query];

}