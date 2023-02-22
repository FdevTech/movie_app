import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/domain/entities/local/fav_entity.dart';

import '../../blocs/bloc_favorite/favorite_bloc.dart';

class FavoriteCardWidget extends StatelessWidget {
  final FavEntity movie;
  const FavoriteCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favBloc = context.read<FavoriteBloc>();
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
     // height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "${ApiConstant.BASE_IMAGE_URL}/${movie.posterPath}",
            fit: BoxFit.cover,
            height: 300.h,
            //width: 100,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed:(){
              favBloc.add(UnFavoriteEvent(movieId: movie.id!));
            }, icon: const Icon(
              Icons.delete,
              size: 24,
              color: Colors.white,
            )),
          )
        ],
      ),
    );
  }
}
