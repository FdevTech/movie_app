
import 'package:isar/isar.dart';

import '../../../domain/entities/local/fav_entity.dart';
part 'local_movie.g.dart';
@collection
class FavoriteMovie{
  Id? id;
  String? title;
  String? overview;
  String? backdropPath;
  String? posterPath;

}

extension FavoriteMovie2FavEntity on FavoriteMovie
{
  FavEntity toFavoriteMovie()
  {
    return FavEntity(
        id: id,
        title: title,
        posterPath: posterPath);
  }


}

extension ListFavoriteMovie2ListFavEntity on List<FavoriteMovie>
{
  List<FavEntity> toFavoriteMovie()
  {
    return map((e) => e.toFavoriteMovie()).toList();
  }
}
