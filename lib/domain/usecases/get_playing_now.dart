
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/app_erro.dart';
import '../entities/movie_entity.dart';
import '../entities/no_params.dart';
import '../repositories/movie_repository.dart';

class GetPlayingNow  extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepository repository;

  GetPlayingNow({required this.repository});

  @override
  Future<Either<AppError,List<MovieEntity>>> call(NoParams params) async {
    return await repository.getPlayingNow();
  }
}