import 'package:equatable/equatable.dart';

class FavEntity extends Equatable {
  final int? id;
  final String? title,posterPath;

  const FavEntity({required this.id, required this.title, required this.posterPath});

  @override

  List<Object?> get props => [id,title,posterPath];

}