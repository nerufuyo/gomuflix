import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class GetGomuflixMovieListCase {
  // Declarate Variable
  GomuflixMovieRepository data;

  // Callback Variable
  GetGomuflixMovieListCase(this.data);

  // Get Now Playing Movie
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      nowPlayingAction() {
    return data.getGomuflixMovieNowPlayingAct();
  }

  // Get Popular Movie
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>> popularAction() {
    return data.getGomuflixMoviePopularAct();
  }

  // Get Top Rated Movie
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>> topRatedAction() {
    return data.getGomuflixMovieTopRatedAct();
  }
}
