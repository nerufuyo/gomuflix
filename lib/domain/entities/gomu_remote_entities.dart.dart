import 'package:dartz/dartz.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/domain/entities/gomu_detail_entity.dart';
import 'package:gomuflix/domain/entities/gomu_entity.dart';

// Remote Movie Entities
abstract class GomuflixMoviesRemoteEntities {
  // Movie Detail Entity
  Future<Either<FailureCondition, GomuflixMovieDetailEntity>>
      getGomuflixDetailMovies(id);

  // Movie Entity
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixOnGoingMovies();
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMostWatchedMovies();
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixTopRatedMovies();
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixRecommendationMovies(id);
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      searchGomuflixMovies(query);

  // Watchlist Entity
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixWathlistMovies();
  Future<Either<FailureCondition, String>> removeGomuflixWatchlistMovies(
      GomuflixMovieDetailEntity data);
  Future<Either<FailureCondition, String>> saveGomuflixWatchlistMovies(
      GomuflixMovieDetailEntity data);
  Future<bool> isAddedToWatchlist(id);
}
