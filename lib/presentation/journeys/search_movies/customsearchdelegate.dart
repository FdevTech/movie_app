import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/journeys/search_movies/search_movie_card.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

import '../../blocs/searchBloc/search_bloc.dart';
import '../../themes/app_colors.dart';

import 'dart:developer' as dev show log ;

class CustomSearchDelegate extends SearchDelegate {
  final SearchBloc searchBloc;

  CustomSearchDelegate({required this.searchBloc});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query.isEmpty ? null : query = "";
      },
          icon: Icon(Icons.clear,
            color: query.isEmpty ? Colors.grey : AppColor.royalBlue,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed:(){
      close(context, null);
    }, icon:  const Icon(Icons.arrow_back_ios, color: Colors.white, size: 12,));
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.add(SearchQueryEvent(searchQuery: query));

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchLoaded) {
          final results = state.movies;
          dev.log("log dev ${results.length}");
          if (results.isEmpty) {
            return Center(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 64.w),
                child: const Text(
                  "no movie found",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return SearchMovieCard(
                  movieEntity: results[index],
                );
              });
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColor
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: InputBorder.none,
            hintStyle: Theme
                .of(context)
                .textTheme
                .greySubtitle1
        )
    );
  }
}