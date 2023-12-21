class AppConstant {
  static const baseImageUrl = 'https://image.tmdb.org/t/p/original';
  static String imageUrl(path) {
    return '$baseImageUrl$path';
  }

  static const String apiKey = "51b8287745c28cf72147682f36f10f24";
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String searchMoviesUrl = "$baseUrl/search/movie?api_key=$apiKey";
  static String movieDetailsUrl(int id) => "$baseUrl/movie/$id?api_key=$apiKey";
  static String recommendationsUrl(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";
}
