// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchMovieModel {
  final int? id;
  final String? title;
  final String? overView;
  final String? date;
  final String? image;
  SearchMovieModel({
    this.id,
    this.title,
    this.overView,
    this.date,
    this.image,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      SearchMovieModel(
          id: json['id'],
          date: json['release_date'],
          overView: json['overview'],
          title: json['title'],
          image: json['backdrop_path'] ?? '');
}
