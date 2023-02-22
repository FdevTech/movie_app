import 'package:flutter/material.dart';

import '../../../domain/entities/local/fav_entity.dart';
import 'favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<FavEntity> movies;
  const FavoriteMovieGridView({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16
            ),
            itemCount: movies.length,
            itemBuilder: (context,index){
              return FavoriteCardWidget(
                movie:movies[index]
              );
            }),
    );
  }
}
