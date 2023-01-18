import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'movie_tab_card_widget.dart';




class MovieListView extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieListView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
              title: movie.title,
              posterPath: movie.posterPath,
              movieId: movie.id);
        },
        separatorBuilder: (context, index){
          return SizedBox(
            width: 14.w,
          );
        },
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
    );
  }
}
