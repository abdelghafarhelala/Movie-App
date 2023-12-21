part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MoviedetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  final MovieDetailsModel model;

  MovieDetailsSuccessState(this.model);
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String errorMsg;

  MovieDetailsErrorState(this.errorMsg);
}
