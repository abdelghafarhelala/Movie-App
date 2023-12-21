import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/resources/app_strings.dart';
import 'package:movie/core/services/servies_locator.dart';
import 'package:movie/features/search/presentation/view_models/search_movies_cubit/search_movies_cubit.dart';

import '../widgets/movies_grid.dart';

String? search = '';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchmoviesCubit(sl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.search),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: BlocBuilder<SearchmoviesCubit, SearchmoviesState>(
                      builder: (context, state) {
                    return TextFormField(
                      onChanged: (String? value) {
                        context
                            .read<SearchmoviesCubit>()
                            .getSearchMovies(search: value ?? '');
                      },
                      decoration: const InputDecoration(
                          hintText: AppStrings.search,
                          prefixIcon: Icon(
                            Icons.search,
                          )),
                    );
                  }),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                BlocBuilder<SearchmoviesCubit, SearchmoviesState>(
                    builder: (context, state) {
                  if (state is SearchmoviesSuccessState) {
                    return MoviesGridWidget(movies: state.list);
                  } else if (state is SearchmoviesLoadingState) {
                    return const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()));
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                }),
              ],
            )),
      ),
    );
  }
}
