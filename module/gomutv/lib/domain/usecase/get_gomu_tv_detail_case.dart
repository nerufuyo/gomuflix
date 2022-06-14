import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

// Get Detail Case
class GetGomuflixTvDetailCase {
  // Decalarate Variable
  GomuflixTvRepository data;

  // Callback Variable
  GetGomuflixTvDetailCase(this.data);

  // Get Detail Tv Future
  Future<Either<FailureCondition, GomuflixTvDetailEntity>> detailAction(
      int id) {
    return data.getGomuflixTvDetailAct(id);
  }

  // Get Recomendation Tv Future
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> recommendationAction(
      id) {
    return data.getGomuflixTvRecommendationAct(id);
  }
}
