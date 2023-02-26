

import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/language_entity.dart';

abstract class LanguageRepository {

  Future<Either<AppError,void>> insertLanguage(LanguageEntity languageEntity);

  Future<Either<AppError,LanguageEntity>> getCurrentLanguage();

}