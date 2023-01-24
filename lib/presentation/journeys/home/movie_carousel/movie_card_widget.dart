
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import '../../../../common/constants/size_contants.dart';
import '../../movie_detail/movie_detail_screen.dart';



class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget({Key? key,
    required this.posterPath,
    required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){},
        child: GestureDetector(
          onTap: (){
            Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context){
                     return MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movieId),);
            }));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(
              imageUrl: "${ApiConstant.BASE_IMAGE_URL}$posterPath",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
