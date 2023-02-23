import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_favorite/favorite_bloc.dart';

import '../../../di/get_it.dart';
import 'favorite_movie_grid.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => (getItInstance.get<FavoriteBloc>())..add(const AllFavoriteEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Favorite"),
        ),
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if(state is GetAllFavoriteState)
              {
                final results = state.faavorites;
                if(results.isEmpty)
                  {
                    return  Center(
                      child: Text("No favorites movies yet",style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.white
                      ),),
                    );
                  }
                else {
                  return FavoriteMovieGridView(
                    movies:results
                  );
                }
              }
            if(state is FavoriteInitial)
              {
                return const Center(
                  child: SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                );
              }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
