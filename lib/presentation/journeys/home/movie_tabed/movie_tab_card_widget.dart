import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/common/constants/size_contants.dart';
import 'package:movie_app/common/extensions/string_extension.dart';

class MovieTabCardWidget extends StatelessWidget {
 final int movieId;
 final String title,posterPath;
  const MovieTabCardWidget({Key? key,
    required this.title,
    required this.posterPath,
    required this.movieId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: CachedNetworkImage(
               imageUrl: "${ApiConstant.BASE_IMAGE_URL}$posterPath",
               fit: BoxFit.cover,
              ),

            )),
         Padding(
           padding:EdgeInsets.only(top: Sizes.dimen_4.h),
           child: Text(
             title.intelliTrim(),
             maxLines: 1,
             textAlign: TextAlign.center,
             style: Theme.of(context).textTheme.subtitle2,
           ),
         )
      ],
    );
  }
}
