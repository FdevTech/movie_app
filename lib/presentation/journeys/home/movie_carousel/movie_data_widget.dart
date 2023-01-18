import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';

class MoviesDataWidget extends StatelessWidget {
  const MoviesDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackdropBloc, BackdropState>(
      builder: (context, state) {
        if(state is MovieBackdropChangeState)
          {
            return Text(
              state.movieEntity.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.headline6,
            );
          }
        return const SizedBox.shrink();
      },
    );
  }
}
