class MovieDetailModel {
  final int id;
  final String title;
  final String overview;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String? posterPath;
  final String? backdropPath;
  final int? budget;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final DateTime? releaseDate;
  final List<Genre> genres;
  final List<ProductionCompany> productionCompanies;

  MovieDetailModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    this.posterPath,
    this.backdropPath,
    this.budget,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.releaseDate,
    this.genres = const [],
    this.productionCompanies = const [],
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
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
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      budget: map['budget'],
      revenue: map['revenue'],
      runtime: map['runtime'],
      status: map['status'],
      tagline: map['tagline'],
      releaseDate: _parseDate(map['release_date']),
      genres:
          (map['genres'] as List?)?.map((e) => Genre.fromMap(e)).toList() ?? [],
      productionCompanies:
          (map['production_companies'] as List?)
              ?.map((e) => ProductionCompany.fromMap(e))
              .toList() ??
          [],
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

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(id: map['id'] ?? 0, name: map['name'] ?? '');
  }
}

class ProductionCompany {
  final int id;
  final String name;
  final String? logoPath;
  final String? originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  factory ProductionCompany.fromMap(Map<String, dynamic> map) {
    return ProductionCompany(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      logoPath: map['logo_path'],
      originCountry: map['origin_country'],
    );
  }
}
