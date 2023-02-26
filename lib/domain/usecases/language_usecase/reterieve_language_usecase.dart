
import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/language_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../../repositories/language_repository.dart';

class RetrieveLanguageUseCase extends UseCase<LanguageEntity,NoParams>
{
  final LanguageRepository languageRepository;

  RetrieveLanguageUseCase(this.languageRepository);
  @override
  Future<Either<AppError, LanguageEntity>> call(NoParams params) async{

    return await languageRepository.getCurrentLanguage();
  }
  
}