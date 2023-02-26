
import 'package:isar/isar.dart';
import 'package:movie_app/data/models/local/language.dart';
import 'package:movie_app/di/get_it.dart';

abstract class LanguageDataSource {
  Future<void> updateLanguage(LanguageModel language);
  Future<LanguageModel?> getCurrentLanguage();
}

class LanguageDataSourceImpl extends LanguageDataSource {
  final Future<Isar> futureIsar;
  late Isar isar;

  LanguageDataSourceImpl({required this.futureIsar}){
     futureIsar.then((value){
       isar = value;
     });
  }
  @override
  Future<LanguageModel?> getCurrentLanguage() async{
      try{

        final currentLanguage = await isar.languageModels.get(0);
        return currentLanguage;
      }
      on Exception {
        rethrow;
      }

  }

  @override
  Future<void> updateLanguage(LanguageModel language) async{
     try{

         final result = await isar.writeTxn(()async{
         await isar.languageModels.put(language);
       });
     }
     on Exception {
       rethrow;
    }
  }
  
}