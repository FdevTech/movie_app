
import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/local/local_movie.dart';

import 'package:movie_app/domain/entities/app_erro.dart';

import 'package:movie_app/domain/entities/local/fav_entity.dart';

import 'package:movie_app/domain/entities/movie_entity.dart';

import '../../domain/repositories/fav_repository.dart';
import '../data_sources/favorite_datasources.dart';
import 'movie_repository_impl.dart';

class FavRepositoryImpl extends FavRepository {
  final FavoriteLocalDataSource favoriteLocalDataSourceImpl;

  FavRepositoryImpl({required this.favoriteLocalDataSourceImpl});

  @override
  Future<Either<AppError, bool>> adToFav(MovieEntity movieEntity) async {
       try{
         final movieFav =  FavoriteMovie()
           ..title = movieEntity.title
           ..posterPath=movieEntity.posterPath
           ..overview=movieEntity.overview
           ..id = movieEntity.id ;
        final result= await favoriteLocalDataSourceImpl.insert(movieFav);
        return Right(result);
       }
       on Exception
       {
        return const Left(AppError(AppErrorType.api));
       }

  }

  @override
  Future<Either<AppError, List<FavEntity>>> getAllFav() async {

          try{
           final result = await favoriteLocalDataSourceImpl.getAllFavorite();
           return Right(result.toFavoriteMovie());
          }
          on Exception {
            return const Left(AppError(AppErrorType.api));
          }

  }

  @override
  Future<Either<AppError, bool>> isFav(int id) async{
    try{
      final result = await favoriteLocalDataSourceImpl.isFav(id);
      return Right(result);
    }
    on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> unFav(int id) async{
    try{
      final result = await favoriteLocalDataSourceImpl.unFavorite(id);
      return Right(result);
    }
    on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

}