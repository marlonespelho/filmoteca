import 'package:tmdb/modules/catalog/models/production_company.dart';
import 'package:tmdb/modules/catalog/models/production_country.dart';
import 'package:tmdb/modules/catalog/models/spoken_language.dart';
import 'genre.dart';

class MovieDetails {
  bool adult;
  String? backdropPath;
  List<Genre> genres;
  String homepage;
  int id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
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
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies:
          List<ProductionCompany>.from(json['production_companies'].map((x) => ProductionCompany.fromJson(x))),
      productionCountries:
          List<ProductionCountry>.from(json['production_countries'].map((x) => ProductionCountry.fromJson(x))),
      releaseDate: DateTime.parse(json['release_date']),
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: List<SpokenLanguage>.from(json['spoken_languages'].map((x) => SpokenLanguage.fromJson(x))),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
