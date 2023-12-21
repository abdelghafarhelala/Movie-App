import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/resources/app_assets.dart';
import 'package:movie/core/resources/app_strings.dart';
import 'package:movie/core/widgets/common_use.dart';
import 'package:movie/features/movie_details/presentation/view_models/recommendations/recommendations_cubit.dart';

import '../../../search/presentation/widgets/movie_image.dart';

class MoreLikeThisWidget extends StatelessWidget {
  const MoreLikeThisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsCubit, RecommendationsState>(
      builder: (context, state) {
        if (state is RecommendationsLoadingState) {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is RecommendationsSuccessState) {
          if (state.model.isNotEmpty) {
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      child: MovieImage(
                          imageUrl: state.model[index].image ?? '',
                          width: 0,
                          height: 100));
                },
                childCount: state.model.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: buildNoItemDynamic(
                  message: AppStrings.noRecommendationHere,
                  imagePath: AppAssets.noRecomendationFound,
                  context: context),
            );
          }
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
