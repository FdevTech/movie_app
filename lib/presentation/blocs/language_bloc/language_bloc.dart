
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/domain/entities/language_entity.dart';

import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/usecase.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  UseCase<LanguageEntity,NoParams> retrieveLanguageUseCase;
  UseCase<void, LanguageEntity> updateLanguageUseCase;

  LanguageBloc({
    required this.retrieveLanguageUseCase,
    required this.updateLanguageUseCase}) : super(LanguageLoaded(Locale(Languages.languages[0].code))) {
    on<LoadCurrentLanguage>((event, emit) async {
     final result = await retrieveLanguageUseCase(NoParams());
     result.fold((l) => emit(LanguageError()),
             (r) => emit(LanguageLoaded(Locale(r.code))) );
    });

    on<ToggleLanguageEvent>((event, emit) async{

      final result  = await updateLanguageUseCase(event.language);
      result.fold((l) => emit(LanguageError()),
              (r) {
                add(LoadCurrentLanguage());
                emit(LanguageUpdated());
              });
      //emit(LanguageLoaded(Locale(event.language.code)));
    });
  }
}
