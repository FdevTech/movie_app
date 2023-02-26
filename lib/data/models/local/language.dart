
import 'package:isar/isar.dart';
import 'package:movie_app/domain/entities/language_entity.dart';

part 'language.g.dart';
@collection
class LanguageModel {
   Id? id;
   String? code;
   String? value;



}

extension LanguageModel2LanguageEntity on LanguageModel{
  LanguageEntity toLanguageEntity()
  {
    return LanguageEntity(code: code??"en", value: value??"English",

    );
  }

}
extension LanguageEntiry2Language on LanguageEntity{
  LanguageModel toLanguageModel()
  {
    return LanguageModel()
           ..id=0
           ..value=value
           ..code =code
        ;
  }

}

