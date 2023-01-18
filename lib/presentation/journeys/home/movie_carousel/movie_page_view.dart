import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';

import '../../../../common/constants/size_contants.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView({Key? key,
    required this.movies,
    required this.initialPage}) : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      keepPage: false,
      initialPage: widget.initialPage,
      viewportFraction: 0.7
    );
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final backdropBloc = BlocProvider.of<BackdropBloc>(context);
    return Container(
      margin:EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil().screenHeight*0.35,
      child: PageView.builder(

          controller: _pageController,
          itemCount: widget.movies.length,
          pageSnapping: true,
          itemBuilder: (context, index){
            final movieEntity = widget.movies[index];
            return AnimatedMovieCardWidget(
                index: index,
                pageController: _pageController,
                posterPath: movieEntity.posterPath,
                movieId: movieEntity.id);
          },
          onPageChanged: (index){
            backdropBloc.add(MovieBackdropChangeEvent(movie: widget.movies[index]));
          },
      ),
    );
  }
}
