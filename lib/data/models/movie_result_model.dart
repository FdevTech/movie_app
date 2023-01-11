import 'movie_modal.dart';

class MovieResultsModel {
  List<MovieModel>? results;


  MovieResultsModel(
      {this.results,});

  MovieResultsModel.fromJson(Map<String, dynamic> json) {

    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

