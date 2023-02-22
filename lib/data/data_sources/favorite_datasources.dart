import 'package:isar/isar.dart';
import 'package:movie_app/data/models/local/local_movie.dart';

abstract class FavoriteLocalDataSource{

  Future<List<FavoriteMovie>> getAllFavorite();
  Future<bool> isFav(int id);
  Future<bool> insert(FavoriteMovie favoriteMovie);
  Future<bool> unFavorite(int id);
}

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  final Isar isar;

  FavoriteLocalDataSourceImpl({required this.isar});
  @override
  Future<List<FavoriteMovie>> getAllFavorite() async {
     try{
       final results  = await isar.favoriteMovies.where().findAll();
       return results;
     }
     on Exception {
       rethrow;
     }
  }

  @override
  Future<bool> insert(FavoriteMovie favoriteMovie) async {
    try{
      final result  = await isar.writeTxn(() async {
        return await isar.favoriteMovies.put(favoriteMovie);

      });
      return result != -1;
    }
    on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> isFav(int id) async {
    try{
      final result  = await isar.favoriteMovies.get(id);
      return result!=null;
    }
    on Exception {
      rethrow;
    }
  }

  @override
  Future<bool> unFavorite(int id) async{
    bool result = false;
    try{
       await isar.writeTxn(() async{
         result = await isar.favoriteMovies.delete(id);
      });
      return result;
    }
    on Exception {
      rethrow;
    }
  }

}