

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/data_sources/movie_datasourece.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_comming_soon.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_carousel/movie_carasel_bloc.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabed_bloc.dart';

import '../common/constants/Api_Constant.dart';
import '../data/core/api_client.dart';
import '../domain/usecases/getCast.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_trending.dart';
import '../presentation/blocs/cast_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {

  getItInstance.registerLazySingleton<Dio>(() => Dio(
      BaseOptions(
          baseUrl: ApiConstant.BASE_URL
      )
  ));

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<GetCast>(() => GetCast(repository: getItInstance()));
  
  getItInstance.registerFactory(() => MovieCarouselBloc(getTrending: getItInstance(), backdropBloc: getItInstance()));

  getItInstance.registerFactory<BackdropBloc>(() => BackdropBloc());
  
  getItInstance.registerFactory<MovieTabBloc>(() => MovieTabBloc(
      getPlayingNow: getItInstance(),
      getPopular: getItInstance(),
      getComingSoon: getItInstance()));


  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  getItInstance.registerFactory<CastBloc>(() => CastBloc(getCast: getItInstance()));

  getItInstance.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(getMovieDetail: getItInstance(),castBloc: getItInstance()));


}