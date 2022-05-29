import 'dart:convert';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/data/database/gomu_database_handler.dart';
import 'package:gomuflix/data/models/gomu_movie_models.dart';
import 'package:gomuflix/data/models/gomu_response_model.dart';
import 'package:http/http.dart' as http;

// Future Scaffold From API
abstract class GomuflixMovieRemoteDatabase {
  Future<GomuflixMovieDetailModel> getGomuDetailMovieDatabase(id);
  Future<List<GomuflixMovieModel>> getGomuOnGoingMovieDatabase();
  Future<List<GomuflixMovieModel>> getGomuMostWatchedMovieDatabase();
  Future<List<GomuflixMovieModel>> getGomuTopRatedMovieDatabase();
  Future<List<GomuflixMovieModel>> getGomuRecommendationMovieDatabase(id);
  Future<List<GomuflixMovieModel>> searchGomuMovieDatabase(query);
}

// Get Value From API
class GomuflixMovieRemoteDatabaseImpl implements GomuflixMovieRemoteDatabase {
  // Declarate Variable
  static const apiKey = 'api_key=ab928dff2a30e6644d3b02d58a3784cc';
  static const baseUrl = 'https://api.themoviedb.org/3';
  final http.Client client;

  // Callback Variable
  GomuflixMovieRemoteDatabaseImpl({required this.client});

  // Get On Going Movie from API
  @override
  Future<List<GomuflixMovieModel>> getGomuOnGoingMovieDatabase() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Detail
  @override
  Future<GomuflixMovieDetailModel> getGomuDetailMovieDatabase(id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  // Get Movie Most Wathed
  @override
  Future<List<GomuflixMovieModel>> getGomuMostWatchedMovieDatabase() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Recommendation
  @override
  Future<List<GomuflixMovieModel>> getGomuRecommendationMovieDatabase(
      id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Top Rated
  @override
  Future<List<GomuflixMovieModel>> getGomuTopRatedMovieDatabase() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Search Movie
  @override
  Future<List<GomuflixMovieModel>> searchGomuMovieDatabase(query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }
}

// Future Scaffold On Local
abstract class GomuflixMovieLocalDatabase {
  Future<GomuflixMovieWatchlistModel?> getGomuMovieById(int id);
  Future<List<GomuflixMovieWatchlistModel>> getGomuWatchlistMovies();
  Future<String> insertGomuWatchlistMovie(GomuflixMovieWatchlistModel data);
  Future<String> removeGomuWatchlistMovie(GomuflixMovieWatchlistModel data);
}

// Change Value on Local
class GomuflixMovieLocalDatabaseImpl implements GomuflixMovieLocalDatabase {
  // Declareate Variable
  final DatabaseHandler databaseHandler;
  GomuflixMovieLocalDatabaseImpl({required this.databaseHandler});

  // Get Movie by Id
  @override
  Future<GomuflixMovieWatchlistModel?> getGomuMovieById(int id) async {
    final result = await databaseHandler.getGomuMovieById(id);
    if (result != null) {
      return GomuflixMovieWatchlistModel.fromMap(result);
    } else {
      return null;
    }
  }

  // Get Watchlist Movie
  @override
  Future<List<GomuflixMovieWatchlistModel>> getGomuWatchlistMovies() async {
    final result = await databaseHandler.getGomuWatchlistMovies();
    return result
        .map((data) => GomuflixMovieWatchlistModel.fromMap(data))
        .toList();
  }

  // Add Movie To Watchlist
  @override
  Future<String> insertGomuWatchlistMovie(
      GomuflixMovieWatchlistModel data) async {
    try {
      await databaseHandler.insertGomuWatchlistMovie(data);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  // Remove Movie from Watchlist
  @override
  Future<String> removeGomuWatchlistMovie(
      GomuflixMovieWatchlistModel data) async {
    try {
      await databaseHandler.removeGomuWatchlistMovie(data);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
