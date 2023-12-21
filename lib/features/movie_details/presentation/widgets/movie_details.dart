import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/features/movie_details/data/models/movie_details_model.dart';

import 'geners.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetailsModel movie;
  const MovieDetailsWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title ?? '',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                )),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    (movie.date ?? '').split('-')[0],
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      (movie.voteAvarage ?? 0 / 2).toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                  ],
                ),
                const SizedBox(width: 16.0),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              movie.overView ?? '',
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                  color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            GenresWidget(genres: movie.genres ?? []),
          ],
        ),
      ),
    );
  }
}
