import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movie_details/data/models/movie_details_model.dart';
import 'package:movie/features/movie_details/data/models/recomendation_model.dart';
import 'package:movie/features/movie_details/data/repo/movie_details_repo.dart';

import '../../../../core/app_const/app_const.dart';
import '../../../../core/network/dio_helper.dart';

class MovieDetailsRepoImp implements MovieDetailsRepo {
  @override
  Future<Either<Failure, MovieDetailsModel>> movieDetails(int id) async {
    try {
      var data = await DioHelper.getDataWithoutToken(
        url: AppConstant.movieDetailsUrl(id),
      );
      return right(MovieDetailsModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecomendationsModel>>> getRecommendations(
      int id) async {
    try {
      var data = await DioHelper.getDataWithoutToken(
        url: AppConstant.recommendationsUrl(id),
      );
      return right(
        List<RecomendationsModel>.from(
          (data.data['results'] as List).map(
            (e) => RecomendationsModel.fromJson(e),
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
