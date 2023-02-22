import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/blocs/bloc_favorite/favorite_bloc.dart';

import 'dart:developer' as dev show log;

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24.h,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if(state is IsFavoriteState) {
              dev.log("isFav ${state.isFav}");
              final isFav = state.isFav;
              if(isFav)
                {
                  return Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 24.h,
                  );
                }
               else {
                return Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 24.h,
                );
              }
            }
            else {
              return Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 24.h,
              );
            }
          },
        )
      ],
    );
  }
}
