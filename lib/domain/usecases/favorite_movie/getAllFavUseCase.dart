import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/local/fav_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../../repositories/fav_repository.dart';

class AllFavoriteUseCase extends UseCase<List<FavEntity>,NoParams>
{
  final FavRepository favRepository;

  AllFavoriteUseCase({required this.favRepository});

  @override
  Future<Either<AppError, List<FavEntity>>> call(NoParams params) async{

      return await favRepository.getAllFav();

  }

}