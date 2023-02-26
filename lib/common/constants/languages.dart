
import 'package:movie_app/domain/entities/language_entity.dart';

class Languages {
  const Languages._();
  static final languages =[
    LanguageEntity(code: "en", value: "English"),
    LanguageEntity(code: "fr", value: "French")
  ];
}