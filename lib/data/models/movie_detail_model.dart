import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';

part 'movie_detail_model.g.dart';

extension ModelToEntity on MovieDetailModel
{
  MovieDetailEntity toMovieDetailEntity()
  {
    return MovieDetailEntity(
        id: id,
        title: title,
        overview: overview,
        releaseDate: release_date,
        voteAverage: vote_average,
        backdropPath: backdrop_path,
        posterPath: posterPath);
  }
}


@JsonSerializable(explicitToJson: true)
class MovieDetailModel {
  final bool? adult;
  final String? backdrop_path;
  final bool? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompanies>? productionCompanies;
  final List<ProductionCountries>? productionCountries;
  final String? release_date;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguages>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? vote_average;
  final int? voteCount;

  MovieDetailModel(
      {
        required this.adult,
        required this.backdrop_path,
        required this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.release_date,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.vote_average,
        required this.voteCount});

  factory MovieDetailModel.fromJson(Map<String,dynamic> json) => _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);


}
@JsonSerializable()
class Genres {
  final int? id;
  final String? name;

  Genres({required this.id, required this.name});
  factory Genres.fromJson(Map<String,dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);

}

@JsonSerializable()
class ProductionCompanies {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});
  factory ProductionCompanies.fromJson(Map<String,dynamic> json) => _$ProductionCompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);

}

@JsonSerializable()
class ProductionCountries {
  final String? iso31661;
  final String? name;

  ProductionCountries({this.iso31661, this.name});


  factory ProductionCountries.fromJson(Map<String,dynamic> json) => _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);

}

@JsonSerializable()
class SpokenLanguages {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String,dynamic> json) => _$SpokenLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}