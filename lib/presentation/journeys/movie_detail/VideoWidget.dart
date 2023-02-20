import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/videobloc/video_bloc.dart';
import 'package:movie_app/presentation/journeys/watch_videos/watchvideoargument.dart';
import 'package:movie_app/presentation/journeys/watch_videos/watchvideoscreen.dart';
import 'package:movie_app/presentation/widgets/button.dart';
import 'dart:developer' as dev show log;
class VideoWidget extends StatelessWidget {
  final VideoBloc videobloc;
  const VideoWidget({Key? key,required this.videobloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videobloc,
      builder: (context, state){
        dev.log("sta eis Videeo Loaded ${state is VideoLoaded} ");
        if(state is VideoLoaded)
          {
            dev.log("empty ${state.videoEntity.length}");
          }
         if(state is VideoLoaded && state.videoEntity.isNotEmpty)
           {
             final videos = state.videoEntity;
             return Button(
                 text: "watch trailer",
                 onPressed: (){
                   Navigator.of(context).push(
                     MaterialPageRoute(builder: (context){
                       return WatchScreen(watchVideoArgument: WatchVideoArgument(videoEntity: videos));
                     })
                   );
                 });
           }
         else {
           return const SizedBox.shrink();
         }
      },
    );
  }
}
