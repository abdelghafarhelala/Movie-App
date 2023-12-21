// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movie/features/movie_details/data/models/geners_model.dart';

class MovieDetailsModel {
  final int? id;
  final String? title;
  final String? overView;
  final String? date;
  final String? image;
  final List<GenresModel>? genres;
  final double? voteAvarage;

  MovieDetailsModel(
      {this.id,
      this.title,
      this.overView,
      this.date,
      this.image,
      this.genres,
      this.voteAvarage});
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        date: json['release_date'],
        image: json['poster_path'],
        overView: json['overview'],
        voteAvarage: (json['vote_average'] ?? 0).toDouble(),
        genres: List<GenresModel>.from(
          (json['genres']).map<GenresModel>(
            (x) => GenresModel.fromJson(x),
          ),
        ),
      );
}
