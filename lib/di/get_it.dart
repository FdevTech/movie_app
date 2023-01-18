

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/data_sources/movie_datasourece.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_comming_soon.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_carousel/movie_carasel_bloc.dart';

import '../common/constants/Api_Constant.dart';
import '../data/core/api_client.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_trending.dart';

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

  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getItInstance()));
  
  getItInstance.registerFactory(() => MovieCarouselBloc(getTrending: getItInstance(), backdropBloc: getItInstance()));

  getItInstance.registerFactory<BackdropBloc>(() => BackdropBloc());



}