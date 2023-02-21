
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/movie_params.dart';

class SearchCase extends UseCase<List<MovieEntity>,SearchParams>
{
  final MovieRepository movieRepository;

  SearchCase({required this.movieRepository});
  @override
  Future<Either<AppError, List<MovieEntity>>> call(SearchParams params) async {
      final results = await movieRepository.searchMovie(params.query);

      return results;
  }

}