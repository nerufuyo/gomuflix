import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

class GomuflixTvRepositoryImpl implements GomuflixTvRepository {
  // Declarate Variable
  final GomuflixTvRemoteApiDatasource remoteTvDatasource;

  // Callback Variable
  GomuflixTvRepositoryImpl({required this.remoteTvDatasource});

  // Get Tv On Air Action
  @override
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvOnAirAct() async {
    // Declarate Variable
    final result = await remoteTvDatasource.getGomuTvOnAirDatasource();

    // Condition Handle
    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Tv Detail Action
  @override
  Future<Either<FailureCondition, GomuflixTvDetailEntity>>
      getGomuflixTvDetailAct(int id) async {
    // Declarate Variable
    final result = await remoteTvDatasource.getGomuTvDetailDatasource(id);

    // Condition Handle
    try {
      return Right(result.toEntity());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Tv Recommendation Action
  @override
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvRecommendationAct(id) async {
    // Declarate Variable
    final result =
        await remoteTvDatasource.getGomuTvRecommendationDatasource(id);

    // Condition Handle
    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Tv Popular Action
  @override
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvPopularAct() async {
    // Declarate Variable
    final result = await remoteTvDatasource.getGomuTvPopularDatasource();

    // Condition Handle
    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Tv Top Rated Action
  @override
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvTopRatedAct() async {
    // Declarate Variable
    final result = await remoteTvDatasource.getGomuTvTopRatedDatasource();

    // Condition Handle
    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Search Tv Action
  @override
  Future<Either<FailureCondition, List<GomuflixTvEntity>>> searchGomuflixTvAct(
      String query) async {
    // Declarate Variable
    final result = await remoteTvDatasource.searchGomuTvDatasource(query);

    // Condition Handle
    try {
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  // Get Tv By Id Action
  @override
  Future<bool> isAddedToWatchlist(int id) async {
    // Declarate Variable
    final result = await remoteTvDatasource.getGomuTvByIdDatasource(id);

    // Return Value
    return result != null;
  }

  // Get Tv Watchlist Action
  @override
  Future<Either<FailureCondition, List<GomuflixTvEntity>>>
      getGomuflixTvWatchlistAct() async {
    // Declarate Variable
    final result = await remoteTvDatasource.getGomuTvWatchlistDatasource();

    // Return Value
    return Right(result.map((data) => data.toEntity()).toList());
  }

  // Save Tv Watchlist Action
  @override
  Future<Either<FailureCondition, String>> saveGomuflixTvAct(
      GomuflixTvDetailEntity tv) async {
    // Declarate Variable
    final result = await remoteTvDatasource.insertGomuTvWatchlistDatasource(
        GomuflixTvWatchlistModel.fromEntity(tv));

    // Conditional Handle
    try {
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  // Remove Tv Watchlist Action
  @override
  Future<Either<FailureCondition, String>> removeGomuflixTvAct(
      GomuflixTvDetailEntity tv) async {
    try {
      final result = await remoteTvDatasource.removeGomuTvWatchlistDatasource(
          GomuflixTvWatchlistModel.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
