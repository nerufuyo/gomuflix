import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

abstract class GomuflixTvRepository {
  // Tv Entities
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvOnAirAct();
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvPopularAct();
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvTopRatedAct();
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvWatchlistAct();
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvRecommendationAct(id);
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> searchGomuflixTvAct(
      String query);

  // Tv Detail Entites
  Future<Either<FailureCondition, GomuflixTvDetailEntity>>
      getGomuflixTvDetailAct(int id);
  Future<Either<FailureCondition, String>> saveGomuflixTvAct(
      GomuflixTvDetailEntity movie);
  Future<Either<FailureCondition, String>> removeGomuflixTvAct(
      GomuflixTvDetailEntity movie);
  Future<bool> isAddedToWatchlist(int id);
}
