
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../../repositories/fav_repository.dart';

class AddFavoriteUseCase extends UseCase<bool,MovieEntity>
{
  final FavRepository favRepository;

  AddFavoriteUseCase({required this.favRepository});

  @override
  Future<Either<AppError, bool>> call(MovieEntity params) async {

    return await favRepository.adToFav(params);
  }

}