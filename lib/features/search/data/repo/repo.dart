import 'package:dartz/dartz.dart';
import 'package:movie/features/search/data/models/search_movies_model.dart';

import '../../../../core/error/failure.dart';

abstract class SearchMoviesRepo {
  Future<Either<Failure, List<SearchMovieModel>>> searchMovies(String search);
}
