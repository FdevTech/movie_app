
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/video_entity.dart';

import '../entities/app_erro.dart';

abstract class MovieRepository{
  Future<Either<AppError,List<MovieEntity>>> getTrending();
  Future<Either<AppError,List<MovieEntity>>> getPopular();
  Future<Either<AppError,List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError,List<MovieEntity>>> getComingSoon();

  Future<Either<AppError,MovieDetailEntity>> getMovieDetail(int id);

  Future<Either<AppError,List<CastEntity>>>  getCastCrew(int id);

  Future<Either<AppError,List<VideoEntity>>> getVideos(int id);
  
  Future<Either<AppError, List<MovieEntity>>> searchMovie(String query);
}

