part of 'search_movies_cubit.dart';

abstract class SearchmoviesState {}

class SearchmoviesInitial extends SearchmoviesState {}

class SearchmoviesLoadingState extends SearchmoviesState {}

class SearchmoviesSuccessState extends SearchmoviesState {
  final List<SearchMovieModel> list;

  SearchmoviesSuccessState(this.list);
}

class SearchmoviesErrorState extends SearchmoviesState {
  final String errorMsg;

  SearchmoviesErrorState(this.errorMsg);
}
