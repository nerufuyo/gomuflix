import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

// Get Watchlist Case
class GetGomuflixTvWatchlistCase {
  // Declarate Variable
  GomuflixTvRepository data;

  // Callback Variable
  GetGomuflixTvWatchlistCase(this.data);

  // Get Watchlist Future
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> watchlistAction() {
    return data.getGomuflixTvWatchlistAct();
  }

  // Get Watchlist Status Future
  Future<bool> watchlistStatusAction(int id) async {
    return data.isAddedToWatchlist(id);
  }
}

class RemoveGomuflixTvWatchlistCase {
  // Declarate Variable
  GomuflixTvRepository data;

  // Callback Variable
  RemoveGomuflixTvWatchlistCase(this.data);

  // Remove Watchlist Future
  Future<Either<FailureCondition, String>> removeWatchlistAction(
      GomuflixTvDetailEntity dataMovie) {
    return data.removeGomuflixTvAct(dataMovie);
  }
}

class SaveGomuflixTvWatchlistCase {
  // Declarate Variable
  GomuflixTvRepository data;

  // Callback Variable
  SaveGomuflixTvWatchlistCase(this.data);

  // Save Watchlist Future
  Future<Either<FailureCondition, String>> saveWatchlistAction(
      GomuflixTvDetailEntity dataMovie) {
    return data.saveGomuflixTvAct(dataMovie);
  }
}
