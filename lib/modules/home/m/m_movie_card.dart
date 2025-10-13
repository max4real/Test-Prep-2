class MovieCardModel {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String originalLanguage;
  final String? posterPath;
  final String? backdropPath;
  final List<int> genreIds;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final DateTime? releaseDate;

  MovieCardModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.originalLanguage,
    this.posterPath,
    this.backdropPath,
    required this.genreIds,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
  });

  factory MovieCardModel.fromMap(Map<String, dynamic> map) {
    return MovieCardModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      genreIds:
          (map['genre_ids'] as List?)?.map((e) => e as int).toList() ?? [],
      adult: map['adult'] ?? false,
      video: map['video'] ?? false,
      popularity:
          (map['popularity'] is int)
              ? (map['popularity'] as int).toDouble()
              : (map['popularity'] ?? 0.0),
      voteAverage:
          (map['vote_average'] is int)
              ? (map['vote_average'] as int).toDouble()
              : (map['vote_average'] ?? 0.0),
      voteCount: map['vote_count'] ?? 0,
      releaseDate: _parseDate(map['release_date']),
    );
  }

  static DateTime? _parseDate(dynamic date) {
    if (date is String && date.isNotEmpty) {
      try {
        return DateTime.parse(date);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
}
