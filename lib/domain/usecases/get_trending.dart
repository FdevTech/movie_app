 import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepository repository;

  GetTrending({required this.repository});

  @override
  Future<Either<AppError,List<MovieEntity>>> call(NoParams params) async {
    return await repository.getTrending();
  }
 }