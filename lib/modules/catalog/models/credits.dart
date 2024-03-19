class Cast {
  bool adult;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  String creditId;
  String? character;

  Cast({
    required this.adult,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    this.character,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        creditId: json["credit_id"],
        character: json["character"],
      );
}

class Credits {
  int id;
  List<Cast> cast;

  Credits({
    required this.id,
    required this.cast,
  });

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
      );
}
