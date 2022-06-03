import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class SearchGomuflixMovie {
  // Declarate Variable
  final MovieRepository data;

  // Callback Variable
  SearchGomuflixMovie(this.data);

  // Search Movie
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>> execute(
      String query) {
    return data.searchGomuflixMovieAct(query);
  }
}
