import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../../repositories/fav_repository.dart';

class IsFavUseCase extends UseCase<bool,int>
{
  final FavRepository favRepository;

  IsFavUseCase({required this.favRepository});

  @override
  Future<Either<AppError, bool>> call(int params) async {
    return await favRepository.isFav(params);
  }





}