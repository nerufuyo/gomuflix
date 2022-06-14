import 'dart:convert';
import 'package:gomucore/gomucore.dart';
import 'package:http/http.dart' as http;

// Remote Api Datasource
abstract class GomuflixMovieRemoteDatasource {
  // Api Remote
  Future<List<GomuflixMovieModel>> getGomuMovieNowPlayingDatasource();
  Future<List<GomuflixMovieModel>> getGomuMoviePopularDatasource();

  Future<List<GomuflixMovieModel>> getGomuMovieTopRatedDatasource();

  Future<GomuflixMovieDetailModel> getGomuMovieDetailDatasource(int id);

  Future<List<GomuflixMovieModel>> getGomuMovieRecommendationDatasource(int id);

  Future<List<GomuflixMovieModel>> searchGomuMovieDatasource(String query);

  // Local Remote
  Future<GomuflixMovieWatchlistModel?> getGomuMovieByIdDatasource(int id);

  Future<List<GomuflixMovieWatchlistModel>> getGomuMovieWatchlistDatasource();

  Future<String> insertGomuMovieWatchlistDatasource(
      GomuflixMovieWatchlistModel movie);

  Future<String> removeGomuMovieWatchlistDatasource(
      GomuflixMovieWatchlistModel movie);
}

// Remote Api Datasource Implementation
class GomuflixMovieRemoteDataSourceImpl
    implements GomuflixMovieRemoteDatasource {
  // Declare Variable
  final http.Client client;

  final GomuflixMovieDatasourceHandler databaseHelper;

  // Callback Variable
  GomuflixMovieRemoteDataSourceImpl(
      {required this.client, required this.databaseHelper});

  // Get Movie Now Playing Datasource
  @override
  Future<List<GomuflixMovieModel>> getGomuMovieNowPlayingDatasource() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Popular Datasource
  @override
  Future<List<GomuflixMovieModel>> getGomuMoviePopularDatasource() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Top Rated Datasource
  @override
  Future<List<GomuflixMovieModel>> getGomuMovieTopRatedDatasource() async {
    final response =
        await client.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Detail Datasource
  @override
  Future<GomuflixMovieDetailModel> getGomuMovieDetailDatasource(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/movie/$id?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  // Get Movie Recommendation Datasource
  @override
  Future<List<GomuflixMovieModel>> getGomuMovieRecommendationDatasource(
      int id) async {
    final response = await client
        .get(Uri.parse('$baseUrl/movie/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Search Movie Datasource
  @override
  Future<List<GomuflixMovieModel>> searchGomuMovieDatasource(
      String query) async {
    final response = await client
        .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return GomuflixMovieResponseModel.fromJson(json.decode(response.body))
          .gomuMovieList;
    } else {
      throw ServerException();
    }
  }

  // Get Movie Ny Id Datasource
  @override
  Future<GomuflixMovieWatchlistModel?> getGomuMovieByIdDatasource(
      int id) async {
    final result = await databaseHelper.getGomuMovieByIdHandler(id);

    if (result != null) {
      return GomuflixMovieWatchlistModel.fromMap(result);
    } else {
      return null;
    }
  }

  // Get Movie Watchlist Datasource
  @override
  Future<List<GomuflixMovieWatchlistModel>>
      getGomuMovieWatchlistDatasource() async {
    final result = await databaseHelper.getGomuMovieWatchlistHandler();

    return result
        .map((data) => GomuflixMovieWatchlistModel.fromMap(data))
        .toList();
  }

  // Insert Movie Watchlist Datasource
  @override
  Future<String> insertGomuMovieWatchlistDatasource(
      GomuflixMovieWatchlistModel movie) async {
    try {
      // Declarate Variable
      await databaseHelper.insertGomuMovieWatchlistHandler(movie);

      return 'Added to Watchlist';

      // Result
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  // Remove Movie Watchlist Datasource
  @override
  Future<String> removeGomuMovieWatchlistDatasource(
      GomuflixMovieWatchlistModel movie) async {
    try {
      // Declarate Variable
      await databaseHelper.removeGomuMovieWatchlistHandler(movie);

      return 'Removed from Watchlist';

      // Result
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
