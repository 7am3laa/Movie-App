class MovieSearchModel {
  final bool adult;
  final String backdropPath;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;

  MovieSearchModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
  });

  factory MovieSearchModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchModel(
      adult: json['adult'] ?? 'error',
      backdropPath: json['backdrop_path'] ?? '/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg',
      id: json['id'] ?? 'error',
      name: json['name'] ?? 'error',
      originalLanguage: json['original_language'] ?? 'error',
      originalName: json['original_name'] ?? 'error',
      overview: json['overview'] ?? 'error',
      posterPath: json['poster_path'] ?? '/ww1eIoywghjoMzRLRIcbJLuKnJH.jpg',
    );
  }
}
