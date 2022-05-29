import 'package:dartz/dartz.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/domain/entities/gomu_detail_entity.dart';
import 'package:gomuflix/domain/entities/gomu_remote_entities.dart.dart';

class GetGomuMovieDetailCase {
  final GomuflixMoviesRemoteEntities remoteEntities;
  GetGomuMovieDetailCase(this.remoteEntities);

  Future<Either<FailureCondition, GomuflixMovieDetailEntity>> execute(id) {
    return remoteEntities.getGomuflixDetailMovies(id);
  }
}
