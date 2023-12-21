import 'package:get_it/get_it.dart';
import 'package:movie/features/movie_details/data/repo/movie_details_repo.dart';
import 'package:movie/features/movie_details/data/repo/movie_details_repo_imp.dart';
import 'package:movie/features/search/data/repo/repo.dart';
import 'package:movie/features/search/data/repo/repo_imp.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<SearchMoviesRepo>(
      () => SearchMoviesRepoImp(),
    );
    sl.registerLazySingleton<MovieDetailsRepo>(
      () => MovieDetailsRepoImp(),
    );
  }
}
