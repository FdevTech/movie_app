
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_sources/movie_datasourece.dart';
import 'package:movie_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_modal.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../../domain/entities/app_erro.dart';

class MovieRepositoryImpl extends MovieRepository
{
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<AppError,List<MovieEntity>>> getTrending() async {
    try{
      final movies = await remoteDataSource.getTrending();
      return right(movies.toMovieEntity());
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    }
    on Exception {
      return const Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try{
      final movies = await remoteDataSource.getComingSoon();
      return right(movies.toMovieEntity());
    }  on SocketException {
      return const Left(AppError(AppErrorType.network));
    }
    on Exception {
      return const Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try{
      final movies = await remoteDataSource.getPlayingNow();
      return right(movies.toMovieEntity());
    }  on SocketException {
      return const Left(AppError(AppErrorType.network));
    }
    on Exception {
      return const Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try{
      final movies = await remoteDataSource.getPopular();
      return right(movies.toMovieEntity());
    }  on SocketException {
      return const Left(AppError(AppErrorType.network));
    }
    on Exception {
      return const Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id) async {

    try{
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie.toMovieDetailEntity());
    }
    on SocketException {
       return const Left(AppError(AppErrorType.network));
    }
    on Exception {
        return const Left(AppError(AppErrorType.api));
    }

  }

  @override
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id) async{
    try{
      final casts = await remoteDataSource.getCastCrew(id);
      return Right(casts.toCastEntity());
    }
    on Exception{
      return const Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async {
       try{
       final videos  = await remoteDataSource.getVideos(id);
       return Right(videos?.toVideoEntity()??[]);
       }
       on Exception {
         return const Left(AppError(AppErrorType.network));
       }
  }

}