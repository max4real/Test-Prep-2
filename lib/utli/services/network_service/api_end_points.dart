class ApiEndPoint {
  static String imageBaseUrl(String size) =>
      'https://image.tmdb.org/t/p/w$size';

  static const String nowShowing = "movie/now_playing";
  static const String upcoming = "movie/upcoming";
  static const String popular = "movie/popular";
  static String getDetail(String movieId) => "movie/$movieId";
  static String getCast(String movieId) => "movie/$movieId/credits";
  static const String searchMovie = "search/movie";
}
