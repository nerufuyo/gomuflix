import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

class SearchGomuflixTvCase {
  // Declarate Variable
  final GomuflixTvRepository data;

  // Callback Variable
  SearchGomuflixTvCase(this.data);

  // Future Implementation
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> execute(
      String query) {
    return data.searchGomuflixTvAct(query);
  }
}
