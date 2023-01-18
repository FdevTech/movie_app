import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/Api_Constant.dart';
import 'package:movie_app/presentation/blocs/bloc_backdrop/backdrop_bloc.dart';

import '../../../common/constants/size_contants.dart';

class MovieBackDropWidget extends StatelessWidget {
  const MovieBackDropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      widthFactor: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_40.w)
        ),
        child: Stack(

          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 2,
              child: BlocBuilder<BackdropBloc, BackdropState>(
                builder: (context, state) {
                  if(state is MovieBackdropChangeState)
                    {
                      return CachedNetworkImage(imageUrl: "${ApiConstant.BASE_IMAGE_URL}${state.movieEntity.posterPath}");
                    }
                  return const SizedBox.shrink();
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 1,
                color: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
