

import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/local/language.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/domain/entities/language_entity.dart';
import 'package:movie_app/domain/repositories/language_repository.dart';

import '../data_sources/language_datasource.dart';

class LanguageRepositoryImpl extends LanguageRepository {
  final LanguageDataSource languageDataSource;

  LanguageRepositoryImpl(this.languageDataSource);
  @override
  Future<Either<AppError,LanguageEntity>> getCurrentLanguage() async{
        try{
           final result = await languageDataSource.getCurrentLanguage();
           return Right(result?.toLanguageEntity()??LanguageEntity(code: "en", value: "English"));
        }
        on Exception {
          return const Left(AppError(AppErrorType.database));
        }
  }

  @override
  Future<Either<AppError,void>> insertLanguage(LanguageEntity languageEntity) async{
      try{
        final result =  await languageDataSource.updateLanguage(languageEntity.toLanguageModel());
        return Right(result);
      }
      on Exception {
        return const Left(AppError(AppErrorType.database));
      }
  }
  
}