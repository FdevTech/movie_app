import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_carousel/movie_carasel_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabed_bloc.dart';
import 'dart:developer' as dev show log;

import '../../drawer/navigation_drawer.dart';
import 'movie_carousel/movie_carousel_widget.dart';
import 'movie_tabed/movie_tabbed_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late BackdropBloc backdropBloc;
  late MovieTabBloc movieTabBloc;
  @override
  void initState() {
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    backdropBloc = movieCarouselBloc.backdropBloc;
    movieTabBloc = getItInstance<MovieTabBloc>();
    movieCarouselBloc.add(const CarouselLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    movieCarouselBloc.close();
    backdropBloc.close();
    movieTabBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselBloc>(create: (context) => movieCarouselBloc),
        BlocProvider<BackdropBloc>(create: (context)=>backdropBloc),
        BlocProvider(create: (context)=>movieTabBloc)
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
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
                    child: MovieTabbedWidget(),
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
