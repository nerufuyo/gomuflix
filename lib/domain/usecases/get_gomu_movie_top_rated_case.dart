import 'package:dartz/dartz.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/domain/entities/gomu_entity.dart';
import 'package:gomuflix/domain/entities/gomu_remote_entities.dart.dart';

class GetGomuMovieTopRatedCase {
  final GomuflixMoviesRemoteEntities remoteEntities;
  GetGomuMovieTopRatedCase(this.remoteEntities);

  Future<Either<FailureCondition, List<GomuflixMovieEntity>>> execute() {
    return remoteEntities.getGomuflixTopRatedMovies();
  }
}
