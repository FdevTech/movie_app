
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:movie_app/common/Api_Constant.dart';
import 'package:movie_app/data/models/movie_modal.dart';
import 'package:movie_app/data/models/movie_result_model.dart';

import '../core/api_client.dart';

abstract class MovieRemoteDataSource {

  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getPlayingNow();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource
{
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {

     final responseBody= await _client.get("trending/movie/day");
     final movies = MovieResultsModel.fromJson(responseBody).results;
     print("trending: ${movies?.length.toString()}");
         return movies!;


  }

  @override
  Future<List<MovieModel>> getPopular() async {

    final responseBody= await _client.get("movie/popular",);
    final movies = MovieResultsModel.fromJson(responseBody).results;
    print("popular:${movies?.length.toString()}");
    return movies!;

  }
  @override
  Future<List<MovieModel>> getComingSoon() async {

    final responseBody= await _client.get("movie/upcoming",);
    final movies = MovieResultsModel.fromJson(responseBody).results;
    print("coming soon:${movies?.length.toString()}");
    return movies!;

  }
  @override
  Future<List<MovieModel>> getPlayingNow() async {

    final responseBody= await _client.get("movie/now_playing",);
    final movies = MovieResultsModel.fromJson(responseBody).results;
    print("playing now:${movies?.length.toString()}");
    return movies!;

  }

}