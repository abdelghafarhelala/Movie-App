import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie_details/data/models/recomendation_model.dart';

import '../../../data/repo/movie_details_repo.dart';

part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit(this.movieDetailsRepo) : super(RecommendationsInitial());

  final MovieDetailsRepo movieDetailsRepo;

  Future<void> getMovieDetails({required int id}) async {
    emit(RecommendationsLoadingState());
    var result = await movieDetailsRepo.getRecommendations(id);
    result.fold((fail) {
      emit(RecommendationsErrorState(fail.message));
    }, (recommendations) async {
      emit(RecommendationsSuccessState(recommendations));
    });
  }
}
