part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

}

class LanguageLoaded extends LanguageState
{
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object?> get props => [locale.languageCode];

}

class LanguageUpdated extends LanguageState {

  @override
  List<Object?> get props => [];

}

class LanguageError extends LanguageState {
  @override
  List<Object?> get props => [];

}