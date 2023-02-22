
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import '../entities/app_erro.dart';
import '../entities/local/fav_entity.dart';

abstract class FavRepository {
  Future<Either<AppError,bool>> adToFav(MovieDetailEntity movieEntity);
  Future<Either<AppError, bool>> isFav(int id);
  Future<Either<AppError, bool>> unFav(int id);
  Future<Either<AppError, List<FavEntity>>> getAllFav();
}