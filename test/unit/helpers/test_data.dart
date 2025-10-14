import 'package:test_prep_2/modules/home/m/m_movie_card.dart';

final sampleMovie = MovieCardModel(
  id: 101,
  title: 'Inception',
  posterPath: '/inception_poster.jpg',
  backdropPath: '/inception_backdrop.jpg',
  adult: false,
  video: false,
  voteAverage: 8.3,
  voteCount: 30000,
  releaseDate: DateTime(2010, 7, 16),
);

final sampleMovie2 = MovieCardModel(
  id: 102,
  title: 'The Dark Knight',
  posterPath: '/dark_knight_poster.jpg',
  backdropPath: '/dark_knight_backdrop.jpg',
  adult: false,
  video: false,
  voteAverage: 8.5,
  voteCount: 24000,
  releaseDate: DateTime(2008, 7, 18),
);