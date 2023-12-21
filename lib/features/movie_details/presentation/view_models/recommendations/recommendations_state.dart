part of 'recommendations_cubit.dart';

abstract class RecommendationsState {}

class RecommendationsInitial extends RecommendationsState {}

class RecommendationsLoadingState extends RecommendationsState {}

class RecommendationsSuccessState extends RecommendationsState {
  final List<RecomendationsModel> model;

  RecommendationsSuccessState(this.model);
}

class RecommendationsErrorState extends RecommendationsState {
  final String errorMsg;

  RecommendationsErrorState(this.errorMsg);
}
