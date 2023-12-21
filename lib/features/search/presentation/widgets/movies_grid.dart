import 'package:flutter/material.dart';
import 'package:movie/core/resources/app_assets.dart';
import 'package:movie/core/widgets/common_use.dart';
import 'package:movie/features/search/data/models/search_movies_model.dart';

import 'custom_movie_item.dart';

class MoviesGridWidget extends StatelessWidget {
  final List<SearchMovieModel> movies;
  const MoviesGridWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isNotEmpty) {
      return SliverGrid.builder(
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: _getAspectRation(context),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: _getCrossCount(context)),
        itemBuilder: (context, index) {
          return CustomMovieItem(
            movie: movies[index],
          );
        },
      );
    } else {
      return SliverToBoxAdapter(
        child: buildNoItemDynamic(
            message: 'Try To Search',
            imagePath: AppAssets.noResultFound,
            context: context),
      );
    }
  }

  int _getCrossCount(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width > 800) {
      return 4;
    } else if (width > 600 && width < 800) {
      return 3;
    } else if (width < 300) {
      return 1;
    } else {
      return 2;
    }
  }

  double _getAspectRation(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (MediaQuery.orientationOf(context) == Orientation.portrait) {
      if (width > 600) {
        return 1 / 1.34;
      } else if (width < 150) {
        return .5;
      } else {
        return 1 / 1.62;
      }
    } else {
      if (width > 600) {
        return 1;
      } else if (width < 150) {
        return .5;
      } else {
        return 1 / 1.62;
      }
    }
  }
}
