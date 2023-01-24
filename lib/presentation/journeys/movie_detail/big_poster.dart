import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/common/extensions/num_extension.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.3),
                  Theme.of(context).primaryColor
                ]),

          ),
          child: CachedNetworkImage(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight*2/3,
              fit: BoxFit.fill,
              imageUrl: "${ApiConstant.BASE_IMAGE_URL}${movie.backdropPath}"),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ListTile(
              title: Text(
                movie.title??"",
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text(
                movie.releaseDate??"",
                style: Theme.of(context).textTheme.greySubtitle1,
              ),
              trailing: Text(
                movie.voteAverage?.convertToPercentageString()??"0%",
                style: Theme.of(context).textTheme.violetHeadline6,
              ),
            )),
        Positioned(
            left: 16.w,
            right: 16.w,
            top: ScreenUtil().statusBarHeight+8.h,
            child: const MovieDetailAppBar())
      ],
    );
  }
}
