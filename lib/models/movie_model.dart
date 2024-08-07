class MovieModel {
  final int id;
  final String adult;
  final String backdropPath;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final String video;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 'error',
      adult: json['adult'].toString(),
      backdropPath: json['backdrop_path'] ?? 'error',
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      originalLanguage: json['original_language'] ?? 'error',
      originalTitle: json['original_title'] ?? 'error',
      overview: json['overview'] ?? 'error',
      popularity: json['popularity'] ?? 'error',
      posterPath: json['poster_path'] ?? 'error',
      releaseDate: json['release_date'] ?? 'error',
      title: json['title'] ?? 'error',
      video: json['video'].toString(),
      voteAverage: json['vote_average'] ?? 'error',
      voteCount: json['vote_count'] ?? 'error',
    );
  }
}
