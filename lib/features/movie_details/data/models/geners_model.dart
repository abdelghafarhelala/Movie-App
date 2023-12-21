// ignore_for_file: public_member_api_docs, sort_constructors_first
class GenresModel {
  final int? id;
  final String? name;
  GenresModel({
    this.id,
    this.name,
  });
  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);
}
