import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class GetGomuflixMovieDetailCase {
  // Declare Variable
  GomuflixMovieRepository data;

  // Callback Variable
  GetGomuflixMovieDetailCase(this.data);

  // Get Movie Detail Implementation
  Future<Either<FailureCondition, GomuflixMovieDetailEntity>> detailAction(
      int id) {
    return data.getGomuflixMovieDetailAct(id);
  }

  // Get Movie Recommendation Implementation
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      recommendationAction(id) {
    return data.getGomuflixMovieRecommendationAct(id);
  }
}
