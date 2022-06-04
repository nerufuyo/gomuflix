import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class GomuflixMovieRepositoryImpl implements MovieRepository {
  // Declare Variable
  final GomuflixMovieRemoteDatasource remoteMovieDataSource;

  // Callback Variable
  GomuflixMovieRepositoryImpl({required this.remoteMovieDataSource});

  // Get Movie Now Playing
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieNowPlayingAct() async {
    final result =
        await remoteMovieDataSource.getGomuMovieNowPlayingDatasource();

    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Movie Detail
  @override
  Future<Either<FailureCondition, GomuflixMovieDetailEntity>>
      getGomuflixMovieDetailAct(int id) async {
    final result = await remoteMovieDataSource.getGomuMovieDetailDatasource(id);

    try {
      return Right(result.toEntity());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Movie Recommendation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieRecommendationAct(int id) async {
    final result =
        await remoteMovieDataSource.getGomuMovieRecommendationDatasource(id);

    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Popular Movie
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMoviePopularAct() async {
    final result = await remoteMovieDataSource.getGomuMoviePopularDatasource();

    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Movie Top Rated
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieTopRatedAct() async {
    final result = await remoteMovieDataSource.getGomuMovieTopRatedDatasource();

    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Search Movie
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      searchGomuflixMovieAct(String query) async {
    final result = await remoteMovieDataSource.searchGomuMovieDatasource(query);

    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get  Movie By Id
  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await remoteMovieDataSource.getGomuMovieByIdDatasource(id);

    return result != null;
  }

  // Get Movie Watchlist
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMovieWatchlistAct() async {
    final result =
        await remoteMovieDataSource.getGomuMovieWatchlistDatasource();

    return Right(result.map((data) => data.toEntity()).toList());
  }

  // Save Movie Watchlist
  @override
  Future<Either<FailureCondition, String>> saveGomuflixMovieWatchlistAct(
      GomuflixMovieDetailEntity movie) async {
    final result =
        await remoteMovieDataSource.insertGomuMovieWatchlistDatasource(
            GomuflixMovieWatchlistModel.fromEntity(movie));

    try {
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  // Remove Movie Watchlist
  @override
  Future<Either<FailureCondition, String>> removeGomuflixMovieWatchlistAct(
      GomuflixMovieDetailEntity movie) async {
    final result =
        await remoteMovieDataSource.removeGomuMovieWatchlistDatasource(
            GomuflixMovieWatchlistModel.fromEntity(movie));

    try {
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
