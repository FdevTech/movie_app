
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:movie_app/data/data_sources/favorite_datasources.dart';
import 'package:movie_app/data/data_sources/movie_datasourece.dart';
import 'package:movie_app/data/models/local/local_movie.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/favorite_movie/addfav_usecase.dart';
import 'package:movie_app/domain/usecases/favorite_movie/getAllFavUseCase.dart';
import 'package:movie_app/domain/usecases/favorite_movie/unfav_usecase.dart';
import 'package:movie_app/domain/usecases/getVideos.dart';
import 'package:movie_app/domain/usecases/get_comming_soon.dart';
import 'package:movie_app/domain/usecases/get_movie_detail.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_carousel/movie_carasel_bloc.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabed_bloc.dart';

import '../common/constants/Api_Constant.dart';
import '../data/core/api_client.dart';
import '../data/repositories/fav_repository_impl.dart';
import '../domain/entities/local/fav_entity.dart';
import '../domain/entities/movie_detail_entity.dart';
import '../domain/entities/no_params.dart';
import '../domain/repositories/fav_repository.dart';
import '../domain/usecases/favorite_movie/is_Fav_usecase.dart';
import '../domain/usecases/getCast.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_trending.dart';
import '../domain/usecases/search_case.dart';
import '../presentation/blocs/bloc_favorite/favorite_bloc.dart';
import '../presentation/blocs/cast_bloc.dart';
import '../presentation/blocs/searchBloc/search_bloc.dart';
import '../presentation/blocs/videobloc/video_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {

  getItInstance.registerLazySingleton<Dio>(() => Dio(
      BaseOptions(
          baseUrl: ApiConstant.BASE_URL
      )
  ));

  getItInstance.registerSingletonAsync<Isar>(()  async{
    return await Isar.open([FavoriteMovieSchema],inspector: true);
  });


  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getItInstance()));


  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(repository: getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<SearchCase>(() => SearchCase(movieRepository:getItInstance()));

  getItInstance.registerLazySingleton<GetVideos>(() => GetVideos(movieRepository: getItInstance()));



  getItInstance.registerLazySingleton<GetCast>(() => GetCast(repository: getItInstance()));
  
  getItInstance.registerFactory(() => MovieCarouselBloc(getTrending: getItInstance(), backdropBloc: getItInstance()));

  getItInstance.registerFactory<BackdropBloc>(() => BackdropBloc());
  
  getItInstance.registerFactory<MovieTabBloc>(() => MovieTabBloc(
      getPlayingNow: getItInstance(),
      getPopular: getItInstance(),
      getComingSoon: getItInstance()));


  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  getItInstance.registerFactory<CastBloc>(() => CastBloc(getCast: getItInstance()));

  getItInstance.registerFactory<VideoBloc>(() => VideoBloc(getVideo: getItInstance()));

  getItInstance.registerFactory<SearchBloc>(() => SearchBloc(searchCase: getItInstance()));
  
  getItInstance.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videoBloc: getItInstance()));




  getItInstance.registerLazySingleton<FavoriteLocalDataSource>(() => FavoriteLocalDataSourceImpl(isar:getItInstance()));

  getItInstance.registerLazySingleton<FavRepository>(() => FavRepositoryImpl(favoriteLocalDataSourceImpl: getItInstance()));



  getItInstance.registerLazySingleton<UseCase<bool,MovieDetailEntity>>(()=>  AddFavoriteUseCase(favRepository: getItInstance()),instanceName: "AddFavoriteUseCase");
  getItInstance.registerLazySingleton<UseCase<List<FavEntity>,NoParams>>(() => AllFavoriteUseCase(favRepository: getItInstance()),instanceName: "AllFavoriteUseCase");
  getItInstance.registerLazySingleton<UseCase<bool,int>>(() => IsFavUseCase(favRepository: getItInstance()),instanceName: "IsFavUseCase");
  getItInstance.registerLazySingleton<UseCase<bool,int>>(() => UnFavUseCase(favRepository: getItInstance()),instanceName: "UnFavUseCase");

  getItInstance.registerFactory<FavoriteBloc>(() {

    return FavoriteBloc(
      addFavoriteUseCase: getItInstance(instanceName: "AddFavoriteUseCase") ,
      allFavoriteUseCase: getItInstance(instanceName: "AllFavoriteUseCase") ,
      isFavUseCase: getItInstance(instanceName: "IsFavUseCase"),
      unFavUseCase: getItInstance(instanceName: "UnFavUseCase"));
  },);


}