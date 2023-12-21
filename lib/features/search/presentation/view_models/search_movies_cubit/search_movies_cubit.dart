// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/search/data/models/search_movies_model.dart';
import 'package:movie/features/search/data/repo/repo.dart';

part 'search_movies_state.dart';

class SearchmoviesCubit extends Cubit<SearchmoviesState> {
  SearchmoviesCubit(this.searchMoviesRepo) : super(SearchmoviesInitial());

  final SearchMoviesRepo searchMoviesRepo;

  Future<void> getSearchMovies({required String search}) async {
    emit(SearchmoviesLoadingState());
    var result = await searchMoviesRepo.searchMovies(search);
    result.fold((fail) {
      emit(SearchmoviesErrorState(fail.message));
    }, (searchList) async {
      emit(SearchmoviesSuccessState(searchList));
    });
  }
}
