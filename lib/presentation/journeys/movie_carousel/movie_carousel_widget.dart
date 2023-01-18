import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/movie_app_bar.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../widgets/separaotr.dart';
import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget({Key? key, required this.defaultIndex, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackDropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies:movies,
              initialPage: defaultIndex
            ),
            const MoviesDataWidget(),
            const Separator()
          ],
        ),
      ],
    );
  }
}
