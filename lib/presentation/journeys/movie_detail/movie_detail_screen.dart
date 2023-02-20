import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/videobloc/video_bloc.dart';
import 'package:movie_app/presentation/journeys/movie_detail/VideoWidget.dart';

import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';




import 'big_poster.dart';
import 'cast_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;
  const MovieDetailScreen({Key? key, required this.movieDetailArguments}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VideoBloc _videoBloc;
  @override
  void initState() {

    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videoBloc = _movieDetailBloc.videoBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(movieId: widget.movieDetailArguments.movieId)
    );
    super.initState();
  }

  @override
  void dispose() {

    _movieDetailBloc.close();
    //_castBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _movieDetailBloc),
            BlocProvider.value(value: _castBloc),
            BlocProvider.value(value: _videoBloc)
          ],
         child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
           builder: (context,state){
             if(state is MovieDetailLoaded)
               {
                 final movieDetail = state.movieDetailEntity;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          BigPoster(
                            movie:movieDetail
                          ), 
                         Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(movieDetail.overview??"",style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),),
                         ),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text("cast",style: Theme.of(context).textTheme.headline6,),
                        ),
                        const CastWidget(),
                        VideoWidget(videobloc:_videoBloc)
                      ],
                    ),
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

      )
    );
  }
}
