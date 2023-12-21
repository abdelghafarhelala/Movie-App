import 'package:flutter/material.dart';
import 'package:movie/core/widgets/common_use.dart';
import 'package:movie/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:movie/features/search/data/models/search_movies_model.dart';

import '../../../../core/app_const/app_const.dart';
import 'movie_image.dart';

class CustomMovieItem extends StatelessWidget {
  final SearchMovieModel movie;
  const CustomMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
            context,
            MovieDetailsView(
              id: movie.id!,
            ));
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieImage(
                imageUrl: AppConstant.imageUrl(movie.image),
                width: 100,
                height: MediaQuery.sizeOf(context).height * .2),
            const SizedBox(
              height: 5,
            ),
            Text(
              movie.title ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              movie.date ?? "",
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              movie.overView ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
