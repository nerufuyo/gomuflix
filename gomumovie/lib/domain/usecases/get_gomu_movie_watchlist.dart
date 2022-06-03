import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

// Get Movie Watchlist
class GetGomuflixMovieWatchlistCase {
  // Declarate Variable
  final MovieRepository data;

  // Callback Variable
  GetGomuflixMovieWatchlistCase(this.data);

  // Get Watchlist Movie
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      watchlistAction() {
    return data.getGomuflixMovieWatchlistAct();
  }

  // Get Watchlist Status Movie
  Future<bool> execute(int id) async {
    return data.isAddedToWatchlist(id);
  }
}

// Save Watchlist Movie
class SaveGomuflixMoviewatchlist {
  // Declarate Variable
  final MovieRepository data;

  // Callback Variable
  SaveGomuflixMoviewatchlist(this.data);

  // Save Watchlist Movie
  Future<Either<FailureCondition, String>> saveWatchlisAction(
      GomuflixMovieDetailEntity movie) {
    return data.saveGomuflixMovieWatchlistAct(movie);
  }
}

// Remove Watchlist Movie
class RemoveGomuflixMoviewatchlist {
  // Declarate Variable
  final MovieRepository data;

  // Callback Variable
  RemoveGomuflixMoviewatchlist(this.data);

  /// remove Watchlist Movie
  Future<Either<FailureCondition, String>> removeWatchlisAction(
      GomuflixMovieDetailEntity movie) {
    return data.removeGomuflixMovieWatchlistAct(movie);
  }
}
