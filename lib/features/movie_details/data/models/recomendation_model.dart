class RecomendationsModel {
  final String? image;

  RecomendationsModel({this.image});
  factory RecomendationsModel.fromJson(Map<String, dynamic> json) =>
      RecomendationsModel(image: json['backdrop_path']);
}
