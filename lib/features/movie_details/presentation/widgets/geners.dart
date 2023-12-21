import 'package:flutter/material.dart';
import 'package:movie/features/movie_details/data/models/geners_model.dart';

class GenresWidget extends StatelessWidget {
  final List<GenresModel> genres;
  const GenresWidget({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < genres.length; i++)
          Text(
            '${genres[i].name} ${i < genres.length - 1 ? '-' : ''} ',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
      ],
    );
  }
}
