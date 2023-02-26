import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/language_entity.dart';
import 'package:movie_app/domain/repositories/language_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

class UpdateLanguageUseCase extends UseCase<void, LanguageEntity>
{
  final LanguageRepository languageRepository;

  UpdateLanguageUseCase(this.languageRepository);
  @override
  Future<Either<AppError, void>> call(LanguageEntity params) async {

     return await languageRepository.insertLanguage(params);
  }

}