import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String name, type, id, key;

  const VideoEntity(
      {required this.name,
      required this.type,
      required this.id,
      required this.key});

  @override
  List<Object?> get props => [name, type, id];
}
