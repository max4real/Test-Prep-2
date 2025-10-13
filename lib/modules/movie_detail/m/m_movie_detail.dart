class MovieDetailModel {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String originalLanguage;
  final bool adult;
  final bool video;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String? imdbId;
  final String? homepage;
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
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;

  MovieDetailModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.originalLanguage,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    this.imdbId,
    this.homepage,
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
    this.productionCountries = const [],
    this.spokenLanguages = const [],
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      originalLanguage: map['original_language'] ?? '',
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
      imdbId: map['imdb_id'],
      homepage: map['homepage'],
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
      productionCountries:
          (map['production_countries'] as List?)
              ?.map((e) => ProductionCountry.fromMap(e))
              .toList() ??
          [],
      spokenLanguages:
          (map['spoken_languages'] as List?)
              ?.map((e) => SpokenLanguage.fromMap(e))
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

class ProductionCountry {
  final String iso;
  final String name;

  ProductionCountry({required this.iso, required this.name});

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso: map['iso_3166_1'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

class SpokenLanguage {
  final String iso;
  final String englishName;
  final String name;

  SpokenLanguage({
    required this.iso,
    required this.englishName,
    required this.name,
  });

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      iso: map['iso_639_1'] ?? '',
      englishName: map['english_name'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
