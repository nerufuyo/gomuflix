import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

abstract class GomuflixMovieRepository {
  // Movie Entities
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieNowPlayingAct();

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMoviePopularAct();

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieTopRatedAct();

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieWatchlistAct();

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieRecommendationAct(int id);

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      searchGomuflixMovieAct(String query);

  // Movie Detail Entites
  Future<Either<FailureCondition, GomuflixMovieDetailEntity>>
      getGomuflixMovieDetailAct(int id);

  Future<Either<FailureCondition, String>> saveGomuflixMovieWatchlistAct(
      GomuflixMovieDetailEntity movie);

  Future<Either<FailureCondition, String>> removeGomuflixMovieWatchlistAct(
      GomuflixMovieDetailEntity movie);

  Future<bool> isAddedToWatchlist(int id);
}
