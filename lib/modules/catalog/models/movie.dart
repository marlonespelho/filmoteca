class Movie {
  int id;
  bool isAdult;
  String? backdropPath;
  List<int> genreIds;
  List<String>? originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  DateTime? releaseDate;
  String title;
  bool hasVideo;
  double voteAverage;
  int voteCount;

  Movie({
    required this.id,
    required this.isAdult,
    required this.backdropPath,
    required this.genreIds,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.hasVideo,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      isAdult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      originCountry: json['origin_country'] != null ? List<String>.from(json['origin_country']) : null,
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: ((json['release_date'] ?? json['first_air_date'] ?? '') as String).isNotEmpty
          ? DateTime.parse(json['release_date'] ?? json['first_air_date'])
          : null,
      title: json['title'],
      hasVideo: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
