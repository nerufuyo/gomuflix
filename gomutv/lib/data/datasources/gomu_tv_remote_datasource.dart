import 'dart:convert';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:http/http.dart' as http;

// Remote Api Datasource
abstract class GomuflixTvRemoteApiDatasource {
  // Api Remote
  Future<List<GomuflixTvModel>> getGomuTvOnAirDatasource();
  Future<List<GomuflixTvModel>> getGomuTvPopularDatasource();
  Future<List<GomuflixTvModel>> getGomuTvTopRatedDatasource();
  Future<GomuflixTvDetailModel> getGomuTvDetailDatasource(int id);
  Future<List<GomuflixTvModel>> getGomuTvRecommendationDatasource(int id);
  Future<List<GomuflixTvModel>> searchGomuTvDatasource(String query);

  // Local Remote
  Future<GomuflixTvWatchlistModel?> getGomuTvByIdDatasource(int id);
  Future<List<GomuflixTvWatchlistModel>> getGomuTvWatchlistDatasource();
  Future<String> insertGomuTvWatchlistDatasource(GomuflixTvWatchlistModel tv);
  Future<String> removeGomuTvWatchlistDatasource(GomuflixTvWatchlistModel tv);
}

// Remote Api Datasource Implementation
class GomuflixTvRemoteApiDatasourceImpl
    implements GomuflixTvRemoteApiDatasource {
  // Declarate Variable
  final GomuflixTvDatasourceHandler databaseHandlerVar;
  final http.Client client;

  // Callback Variable
  GomuflixTvRemoteApiDatasourceImpl(
      {required this.client, required this.databaseHandlerVar});

  // Get Tv On Air Datasource
  @override
  Future<List<GomuflixTvModel>> getGomuTvOnAirDatasource() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixTvResponseModel.fromJson(json.decode(response.body))
          .gomuTvList;
    } else {
      throw ServerException();
    }
  }

  // Get Tv Popular Datasource
  @override
  Future<List<GomuflixTvModel>> getGomuTvPopularDatasource() async {
    final response = await client.get(Uri.parse('$baseUrl/tv/popular?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixTvResponseModel.fromJson(json.decode(response.body))
          .gomuTvList;
    } else {
      throw ServerException();
    }
  }

  // Get Tv Top Rated Datasource
  @override
  Future<List<GomuflixTvModel>> getGomuTvTopRatedDatasource() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixTvResponseModel.fromJson(json.decode(response.body))
          .gomuTvList;
    } else {
      throw ServerException();
    }
  }

  // Get Tv Detail Datasource
  @override
  Future<GomuflixTvDetailModel> getGomuTvDetailDatasource(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixTvDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  // Get Tv Recommendation Datasource
  @override
  Future<List<GomuflixTvModel>> getGomuTvRecommendationDatasource(
      int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey'));

    if (response.statusCode == 200) {
      return GomuflixTvResponseModel.fromJson(json.decode(response.body))
          .gomuTvList;
    } else {
      throw ServerException();
    }
  }

  // Search Tv Datasource
  @override
  Future<List<GomuflixTvModel>> searchGomuTvDatasource(String query) async {
    final response =
        await client.get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query'));

    if (response.statusCode == 200) {
      return GomuflixTvResponseModel.fromJson(json.decode(response.body))
          .gomuTvList;
    } else {
      throw ServerException();
    }
  }

  // Get Tv By Id Datasource Implementation
  @override
  Future<GomuflixTvWatchlistModel?> getGomuTvByIdDatasource(int id) async {
    final result = await databaseHandlerVar.getGomuTvByIdHandler(id);
    if (result != null) {
      return GomuflixTvWatchlistModel.fromMap(result);
    } else {
      return null;
    }
  }

  // Get Tv Watchlist Datasource Implementation
  @override
  Future<List<GomuflixTvWatchlistModel>> getGomuTvWatchlistDatasource() async {
    final result = await databaseHandlerVar.getGomuTvWatchlistHandler();
    return result
        .map((data) => GomuflixTvWatchlistModel.fromMap(data))
        .toList();
  }

  // Add Tv Watchlist Datasource Implementation
  @override
  Future<String> insertGomuTvWatchlistDatasource(
      GomuflixTvWatchlistModel tv) async {
    try {
      await databaseHandlerVar.insertGomuTvWatchlistHandler(tv);
      return 'Added to Watchlist';
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }

  // Remove Tv Watchlist Datasource Implementation
  @override
  Future<String> removeGomuTvWatchlistDatasource(
      GomuflixTvWatchlistModel tv) async {
    try {
      await databaseHandlerVar.removeGomuTvWatchlistHandler(tv);
      return 'Removed from Watchlist';
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }
}
