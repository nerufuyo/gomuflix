import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class GetGomuflixMovieDetailCase {
  final MovieRepository data;

  GetGomuflixMovieDetailCase(this.data);

  Future<Either<FailureCondition, GomuflixMovieDetailEntity>> detailAction(
      int id) {
    return data.getGomuflixMovieDetailAct(id);
  }

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      recommendationAction(id) {
    return data.getGomuflixMovieRecommendationAct(id);
  }
}
