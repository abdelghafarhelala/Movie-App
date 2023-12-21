import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/search/data/models/search_movies_model.dart';
import 'package:movie/features/search/data/repo/repo.dart';

import '../../../../core/app_const/app_const.dart';
import '../../../../core/network/dio_helper.dart';

class SearchMoviesRepoImp implements SearchMoviesRepo {
  @override
  Future<Either<Failure, List<SearchMovieModel>>> searchMovies(
      String search) async {
    try {
      var data = await DioHelper.getDataWithoutToken(
          url: AppConstant.searchMoviesUrl,
          query: {
            "query": search,
          });
      return right(
        List<SearchMovieModel>.from(
          (data.data['results'] as List).map(
            (e) => SearchMovieModel.fromJson(e),
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
