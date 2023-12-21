import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie_details/data/models/movie_details_model.dart';
import 'package:movie/features/movie_details/data/repo/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsRepo) : super(MoviedetailsInitial());

  final MovieDetailsRepo movieDetailsRepo;

  Future<void> getMovieDetails({required int id}) async {
    emit(MovieDetailsLoadingState());
    var result = await movieDetailsRepo.movieDetails(id);
    result.fold((fail) {
      emit(MovieDetailsErrorState(fail.message));
    }, (movie) async {
      emit(MovieDetailsSuccessState(movie));
    });
  }
}
