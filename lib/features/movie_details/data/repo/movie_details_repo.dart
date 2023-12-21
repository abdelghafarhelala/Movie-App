import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movie_details/data/models/movie_details_model.dart';
import 'package:movie/features/movie_details/data/models/recomendation_model.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> movieDetails(int id);
  Future<Either<Failure, List<RecomendationsModel>>> getRecommendations(int id);
}
