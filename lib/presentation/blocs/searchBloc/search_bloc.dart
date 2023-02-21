import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/search_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchCase searchCase;
  SearchBloc({required this.searchCase}) : super(SearchInitial()) {
    on<SearchQueryEvent>((event, emit) async {
        final search = await searchCase( SearchParams(event.searchQuery));

        search.fold((l) => emit(SearchError()),
                (r) => emit(SearchLoaded(movies: r)));

    });
  }
}
