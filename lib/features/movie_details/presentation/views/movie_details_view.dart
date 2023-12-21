import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/resources/app_strings.dart';
import 'package:movie/core/services/servies_locator.dart';
import 'package:movie/features/movie_details/presentation/view_models/movie_details/movie_details_cubit.dart';
import 'package:movie/features/movie_details/presentation/view_models/recommendations/recommendations_cubit.dart';

import '../widgets/more_like_this.dart';
import '../widgets/movie_details.dart';
import '../widgets/movie_details_image.dart';

class MovieDetailsView extends StatelessWidget {
  final int id;
  const MovieDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieDetailsCubit(sl())..getMovieDetails(id: id),
        ),
        BlocProvider(
          create: (context) => RecommendationsCubit(
            sl(),
          )..getMovieDetails(id: id),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MovieDetailsSuccessState) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: MediaQuery.sizeOf(context).height * .45,
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                          MovieDetailsImageWidget(image: state.model.image),
                    ),
                  ),
                  MovieDetailsWidget(movie: state.model),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        AppStrings.moreLikeThis,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                    sliver: MoreLikeThisWidget(),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
