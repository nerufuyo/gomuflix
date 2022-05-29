import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/data/database/gomu_movie_remote_database.dart';
import 'package:gomuflix/data/models/gomu_movie_models.dart';
import 'package:gomuflix/domain/entities/gomu_entity.dart';
import 'package:gomuflix/domain/entities/gomu_detail_entity.dart';
import 'package:gomuflix/domain/entities/gomu_remote_entities.dart.dart';

class GomuflixMovieDatabaseImpl implements GomuflixMoviesRemoteEntities {
  // Declarate Variable
  final GomuflixMovieRemoteDatabase remoteDatabase;
  final GomuflixMovieLocalDatabase localDatabase;

  // Callback Variable
  GomuflixMovieDatabaseImpl(
      {required this.remoteDatabase, required this.localDatabase});

  // Movi Detail Implementation
  @override
  Future<Either<FailureCondition, GomuflixMovieDetailEntity>>
      getGomuflixDetailMovies(id) async {
    try {
      final data = await remoteDatabase.getGomuDetailMovieDatabase(id);
      return Right(data.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // Movie Most Watch Implementation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixMostWatchedMovies() async {
    try {
      final result = await remoteDatabase.getGomuMostWatchedMovieDatabase();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // Movie On Going Implmentation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixOnGoingMovies() async {
    try {
      final result = await remoteDatabase.getGomuOnGoingMovieDatabase();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // Movie Recomendation Implmentation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixRecommendationMovies(id) async {
    try {
      final result =
          await remoteDatabase.getGomuRecommendationMovieDatabase(id);
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // Movie Top Rated Implmentation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixTopRatedMovies() async {
    try {
      final result = await remoteDatabase.getGomuTopRatedMovieDatabase();
      return Right(result.map((data) => data.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  // Movie Watchlist Implmentation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      getGomuflixWathlistMovies() async {
    final result = await localDatabase.getGomuWatchlistMovies();
    return Right(result.map((data) => data.toEntity()).toList());
  }

  // Movie Watchlist Status Implmentation
  @override
  Future<bool> isAddedToWatchlist(id) async {
    final result = await localDatabase.getGomuMovieById(id);
    return result != null;
  }

  // Movie Remove from Watchlist Implmentation
  @override
  Future<Either<FailureCondition, String>> removeGomuflixWatchlistMovies(
      GomuflixMovieDetailEntity data) async {
    try {
      final result = await localDatabase.removeGomuWatchlistMovie(
          GomuflixMovieWatchlistModel.fromEntity(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  // Movie Add to Watchlist Implmentation
  @override
  Future<Either<FailureCondition, String>> saveGomuflixWatchlistMovies(
      GomuflixMovieDetailEntity data) async {
    try {
      final result = await localDatabase.insertGomuWatchlistMovie(
          GomuflixMovieWatchlistModel.fromEntity(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  // Movie Search Implmentation
  @override
  Future<Either<FailureCondition, List<GomuflixMovieEntity>>>
      searchGomuflixMovies(query) async {
    try {
      final result = await remoteDatabase.searchGomuMovieDatabase(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
