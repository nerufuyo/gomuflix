import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

class GetGomuflixTvListCase {
  // Declarate Variable
  final GomuflixTvRepository data;

  // Callback Variable
  GetGomuflixTvListCase(this.data);

  // Get On Air Tv Future
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> onAirAction() {
    return data.getGomuflixTvOnAirAct();
  }

  // Get Popular Tv Future
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> popularAction() {
    return data.getGomuflixTvPopularAct();
  }

  // Get Top rated Tv Future
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> topRatedAction() {
    return data.getGomuflixTvTopRatedAct();
  }
}
