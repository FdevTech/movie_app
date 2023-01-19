import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../common/constants/languages.dart';

class AppLocalisations {
  final Locale locale;
  AppLocalisations(this.locale);
  late Map<String, String> _localizedStrings;
  static const LocalizationsDelegate<AppLocalisations> delegate = _AppLocalizationDelegate();

  static AppLocalisations of(context){
    return Localizations.of(context, AppLocalisations);
  }

  Future<bool> load() async {
    final jsonString = await rootBundle.loadString("assets/languages/${locale.languageCode}.json");
    final Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String translate(String key)
  {
    return _localizedStrings[key]!;
  }
}


class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalisations>
{
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
     return Languages.languages.map((e) => e.code).toList().contains(locale.languageCode);
  }

  @override
  Future<AppLocalisations> load(Locale locale) async {
    AppLocalisations localisations = AppLocalisations(locale);
    await localisations.load();
    return localisations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalisations> old) {
    return false;
  }

}