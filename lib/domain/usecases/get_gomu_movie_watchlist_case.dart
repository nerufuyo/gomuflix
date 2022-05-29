import 'package:dartz/dartz.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/domain/entities/gomu_detail_entity.dart';
import 'package:gomuflix/domain/entities/gomu_entity.dart';
import 'package:gomuflix/domain/entities/gomu_remote_entities.dart.dart';

// Get Watchlist
class GetGomuWatchlistMoviesCase {
  final GomuflixMoviesRemoteEntities remoteEntities;
  GetGomuWatchlistMoviesCase(this.remoteEntities);

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>> execute() {
    return remoteEntities.getGomuflixWathlistMovies();
  }
}

// Get Watchlist Status
class GetGomuWatchlistStatusMoviesCase {
  final GomuflixMoviesRemoteEntities remoteEntities;
  GetGomuWatchlistStatusMoviesCase(this.remoteEntities);

  Future<bool> execute(id) async {
    return remoteEntities.isAddedToWatchlist(id);
  }
}

// Remove Watchlist
class RemoveGomuWatchlistMoviesCase {
  final GomuflixMoviesRemoteEntities remoteEntities;
  RemoveGomuWatchlistMoviesCase(this.remoteEntities);

  Future<Either<FailureCondition, String>> execute(
      GomuflixMovieDetailEntity data) {
    return remoteEntities.removeGomuflixWatchlistMovies(data);
  }
}

// Save Watchlist
class SaveGomuWatchlistMoviesCase {
  final GomuflixMoviesRemoteEntities remoteEntities;
  SaveGomuWatchlistMoviesCase(this.remoteEntities);

  Future<Either<FailureCondition, String>> execute(
      GomuflixMovieDetailEntity data) {
    return remoteEntities.saveGomuflixWatchlistMovies(data);
  }
}
