import 'package:test_prep_2/modules/home/m/m_movie_card.dart';

final sampleMovie = MovieCardModel(
  id: 101,
  title: 'Inception',
  originalTitle: 'Inception',
  overview: 'A thief who steals corporate secrets through dream-sharing.',
  originalLanguage: 'en',
  posterPath: '/inception_poster.jpg',
  backdropPath: '/inception_backdrop.jpg',
  genreIds: [28, 878, 12],
  adult: false,
  video: false,
  popularity: 82.4,
  voteAverage: 8.3,
  voteCount: 30000,
  releaseDate: DateTime(2010, 7, 16),
);

final sampleMovie2 = MovieCardModel(
  id: 102,
  title: 'The Dark Knight',
  originalTitle: 'The Dark Knight',
  overview: 'Batman faces the Joker in Gotham City.',
  originalLanguage: 'en',
  posterPath: '/dark_knight_poster.jpg',
  backdropPath: '/dark_knight_backdrop.jpg',
  genreIds: [18, 28, 80],
  adult: false,
  video: false,
  popularity: 95.3,
  voteAverage: 8.5,
  voteCount: 24000,
  releaseDate: DateTime(2008, 7, 18),
);