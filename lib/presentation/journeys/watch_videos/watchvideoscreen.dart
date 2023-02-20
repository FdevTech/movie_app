import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entities/video_entity.dart';
import 'package:movie_app/presentation/journeys/watch_videos/watchvideoargument.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchScreen extends StatefulWidget {
  final WatchVideoArgument watchVideoArgument;
  const WatchScreen({Key? key, required this.watchVideoArgument}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  late List<VideoEntity> _watchVideoArgument;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _watchVideoArgument = widget.watchVideoArgument.videoEntity;
    _controller = YoutubePlayerController(
        initialVideoId: _watchVideoArgument[0].key,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true
        )
    );
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("watch trailer"),
      ),
      body: YoutubePlayerBuilder(
          player:  YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            aspectRatio: 16/9,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent
            ),
          ),
          builder: (context, player){
            return Column(
              children: [
                player,
                Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int i =0; i<_watchVideoArgument.length;i++)
                        Container(
                          height: 150,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  _controller.load(_watchVideoArgument[i].key);
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: 200.w,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: _watchVideoArgument[i].key,
                                      quality: ThumbnailQuality.high ),
                                ),
                              ),
                              Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(_watchVideoArgument[i].name,style: const TextStyle(color: Colors.white),),))
                            ],
                          ),
                        )
                    ],
                  ),
                ))
              ],
            );
          })
    );
  }
}
