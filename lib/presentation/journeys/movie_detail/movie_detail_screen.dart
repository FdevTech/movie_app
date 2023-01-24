import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import 'dart:developer' as dev show log ;

import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;
  const MovieDetailScreen({Key? key, required this.movieDetailArguments}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  @override
  void initState() {
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieDetailBloc.add(
      MovieDetailLoadEvent(movieId: widget.movieDetailArguments.movieId)
    );
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
          value: _movieDetailBloc,
         child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
           builder: (context,state){
             if(state is MovieDetailLoaded)
               {
                 final movieDetail = state.movieDetailEntity;
                 dev.log("state ==> ${movieDetail.backdropPath}");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        BigPoster(
                          movie:movieDetail
                        )
                    ],
                  );
               }
             else if(state is MovieDetailError)
               {
                 return Container();
               }
             else {
               return const SizedBox.shrink();
             }
           },
         ),

      ),
    );
  }
}
