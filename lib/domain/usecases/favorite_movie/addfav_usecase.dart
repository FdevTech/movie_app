
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../../repositories/fav_repository.dart';

class AddFavoriteUseCase extends UseCase<bool,MovieDetailEntity>
{
  final FavRepository favRepository;

  AddFavoriteUseCase({required this.favRepository});

  @override
  Future<Either<AppError, bool>> call(MovieDetailEntity params) async {

    return await favRepository.adToFav(params);
  }

}