import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_carasel_bloc.dart';
import 'dart:developer' as dev show log;
import '../movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieCarouselBloc.add(const CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCarouselBloc>(
      create: (context) => movieCarouselBloc,
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            dev.log("$state");
            if(state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children:  [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies:state.movies,
                      defaultIndex:state.defaultIndex
                    )
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: Placeholder(
                      color: Colors.grey,
                    ),
                  )
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
