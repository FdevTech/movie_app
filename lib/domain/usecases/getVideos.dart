import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../repositories/movie_repository.dart';

class GetVideos extends UseCase<List<VideoEntity>,MovieParams>
{
  final MovieRepository movieRepository;

   GetVideos({required this.movieRepository});
  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams params) async {
     return await movieRepository.getVideos(params.id);
  }

}