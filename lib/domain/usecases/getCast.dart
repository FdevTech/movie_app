
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_params.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class GetCast extends UseCase<List<CastEntity>,MovieParams>
{
  final MovieRepository repository;

  GetCast({required this.repository});
  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {

    return await repository.getCastCrew(params.id);
  }
  
}