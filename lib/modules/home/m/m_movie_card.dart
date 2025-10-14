import 'dart:convert';

class MovieCardModel {
  final int id;
  final String title;
  final String posterPath;
  final String? backdropPath;
  final bool adult;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final DateTime? releaseDate;

  MovieCardModel({
    required this.id,
    required this.title,
    required this.posterPath,
    this.backdropPath,
    required this.adult,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
  });

  factory MovieCardModel.fromMap(Map<String, dynamic> map) {
    return MovieCardModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      adult: map['adult'] ?? false,
      video: map['video'] ?? false,
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

List<MovieCardModel> decodeMovieList(String jsonString) {
  final List<dynamic> list = json.decode(jsonString);
  return list.map((e) => MovieCardModel.fromMap(e)).toList();
}

String encodeMovieList(List<MovieCardModel> list) {
  final List<Map<String, dynamic>> maps =
      list
          .map(
            (e) => {
              'id': e.id,
              'title': e.title,
              'poster_path': e.posterPath,
              'backdrop_path': e.backdropPath,
              'adult': e.adult,
              'video': e.video,
              'vote_average': e.voteAverage,
              'vote_count': e.voteCount,
              'release_date': e.releaseDate?.toIso8601String(),
            },
          )
          .toList();
  return json.encode(maps);
}
