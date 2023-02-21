import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

import '../movie_detail/movie_detail_arguments.dart';
import '../movie_detail/movie_detail_screen.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const SearchMovieCard({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movieEntity.id),);
          })
        );
      },
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 2.h
          ),
         child: Row(
           children: [
             Padding(padding: EdgeInsets.all(8.w),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(4.w),
               child: CachedNetworkImage(
                 width: 88.w,
                 imageUrl: "${ApiConstant.BASE_IMAGE_URL}${movieEntity.posterPath}",
               ),
             ),
             ),
             Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text(movieEntity.title,style: Theme.of(context).textTheme.subtitle1,),
                     Text(movieEntity.overview,maxLines: 3,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.greySubtitle1,)
                   ],
                 ))
           ],
         ),
      ),
    );
  }
}
