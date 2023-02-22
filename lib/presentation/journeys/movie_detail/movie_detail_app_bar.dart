import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/bloc_favorite/favorite_bloc.dart';

import 'dart:developer' as dev show log;

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieEntity;
  const MovieDetailAppBar({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favBloc = context.read<FavoriteBloc>();
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
        InkWell(
          onTap: (){
            favBloc.add(AddToFavoriteEvent(movieEntity: movieEntity));
          },
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if(state is IsFavoriteState) {
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
                  return InkWell(
                    onTap:(){
                      favBloc.add(AddToFavoriteEvent(movieEntity: movieEntity));
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 24.h,
                    ),
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
          ),
        )
      ],
    );
  }
}
