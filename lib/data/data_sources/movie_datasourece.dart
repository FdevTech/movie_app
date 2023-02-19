
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/data/models/cast_crew_result_data_model.dart';
import 'package:movie_app/data/models/movie_detail_model.dart';
import 'package:movie_app/data/models/movie_modal.dart';
import 'package:movie_app/data/models/movie_result_model.dart';

import '../core/api_client.dart';
import 'dart:developer' as dev show log;
abstract class MovieRemoteDataSource {

  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getPlayingNow();

  Future<MovieDetailModel> getMovieDetail(int id);

  Future<List<CastModel>> getCastCrew(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource
{
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {

     final responseBody= await _client.get("trending/movie/day");
     final movies = MovieResultsModel.fromJson(responseBody).results;
     dev.log("get trending => ${movies?.length}");
         return movies!;


  }

  @override
  Future<List<MovieModel>> getPopular() async {

    final responseBody= await _client.get("movie/popular",);
    final movies = MovieResultsModel.fromJson(responseBody).results;
    dev.log("get popular => ${movies?.length}");
    return movies!;

  }
  @override
  Future<List<MovieModel>> getComingSoon() async {

    final responseBody= await _client.get("movie/upcoming",);
    final movies = MovieResultsModel.fromJson(responseBody).results;
    dev.log("get  soon  => ${movies?.length}");
    return movies!;

  }
  @override
  Future<List<MovieModel>> getPlayingNow() async {

    final responseBody= await _client.get("movie/now_playing",);
    final movies = MovieResultsModel.fromJson(responseBody).results;
   // print("playing now:${movies?.length.toString()}");
    dev.log("get playing now => ${movies?.length}");
    return movies!;

  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async{
    final response = await _client.get("/movie/$id");
    final movie = MovieDetailModel.fromJson(response);

    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get("/movie/$id/credits");
    final cast = CastCrewResultModel.fromJson(response).cast;

    return cast;
  }

}