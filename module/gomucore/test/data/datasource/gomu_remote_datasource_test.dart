import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:gomucore/gomucore.dart';
import 'package:mockito/mockito.dart';

import '../../domain/handler/handler_test.mocks.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../gomu_reader_json.dart';

void main() {
  // Declarate Variable
  late GomuflixTvRemoteApiDatasourceImpl tvRemoteDatasource;
  late MockGomuflixTvDatasourceHandler mockTvDatasourceHandler;

  late GomuflixMovieRemoteDataSourceImpl movieRemoteDatasource;
  late MockGomuflixMovieDatasourceHandler mockMovieDatasourceHandler;

  late MockHttpClient mockHttpClient;

  // Callback Variable
  setUp(() {
    mockHttpClient = MockHttpClient();

    mockTvDatasourceHandler = MockGomuflixTvDatasourceHandler();
    tvRemoteDatasource = GomuflixTvRemoteApiDatasourceImpl(
        client: mockHttpClient, databaseHandlerVar: mockTvDatasourceHandler);

    mockMovieDatasourceHandler = MockGomuflixMovieDatasourceHandler();
    movieRemoteDatasource = GomuflixMovieRemoteDataSourceImpl(
        client: mockHttpClient, databaseHelper: mockMovieDatasourceHandler);
  });

  // Tv
  group('get On Air TV', () {
    final tTvList = GomuflixTvResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_tv_on_air.json')))
        .gomuTvList;

    test('should return list of TV Series Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/gomu_tv_on_air.json'), 200));

      // act
      final result = await tvRemoteDatasource.getGomuTvOnAirDatasource();

      // assert
      expect(result, equals(tTvList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = tvRemoteDatasource.getGomuTvOnAirDatasource();

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular TV Series', () {
    final tTvList = GomuflixTvResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_tv_popular.json')))
        .gomuTvList;

    test('should return list of TV Series when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/gomu_tv_popular.json'), 200));

      // act
      final result = await tvRemoteDatasource.getGomuTvPopularDatasource();

      // assert
      expect(result, tTvList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = tvRemoteDatasource.getGomuTvPopularDatasource();

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated TV Series', () {
    final tTvList = GomuflixTvResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_tv_top_rated.json')))
        .gomuTvList;

    test('should return list of TV Serie swhen response code is 200 ',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_tv_top_rated.json'), 200));

      // act
      final result = await tvRemoteDatasource.getGomuTvTopRatedDatasource();

      // assert
      expect(result, tTvList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = tvRemoteDatasource.getGomuTvTopRatedDatasource();

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get movie detail', () {
    final tId = 1;

    final tTvDetail = GomuflixTvDetailModel.fromJson(
        json.decode(readJson('dummy_data/gomu_tv_detail.json')));

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/gomu_tv_detail.json'), 200));

      // act
      final result = await tvRemoteDatasource.getGomuTvDetailDatasource(tId);

      // assert
      expect(result, equals(tTvDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = tvRemoteDatasource.getGomuTvDetailDatasource(tId);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get movie recommendations', () {
    final tId = 1;

    final tTvList = GomuflixTvResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_tv_recommendation.json')))
        .gomuTvList;

    test('should return list of Tv Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_tv_recommendation.json'), 200));

      // act
      final result =
          await tvRemoteDatasource.getGomuTvRecommendationDatasource(tId);

      // assert
      expect(result, equals(tTvList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = tvRemoteDatasource.getGomuTvRecommendationDatasource(tId);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search movies', () {
    final tSearchResult = GomuflixTvResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_tv_search.json')))
        .gomuTvList;

    final tQuery = 'Money';

    test('should return list of TV Series when response code is 200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/gomu_tv_search.json'), 200));

      // act
      final result = await tvRemoteDatasource.searchGomuTvDatasource(tQuery);

      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = tvRemoteDatasource.searchGomuTvDatasource(tQuery);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockTvDatasourceHandler
              .insertGomuTvWatchlistHandler(testTvSeriesTableModel))
          .thenAnswer((_) async => 1);

      // act
      final result = await tvRemoteDatasource
          .insertGomuTvWatchlistDatasource(testTvSeriesTableModel);

      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockTvDatasourceHandler
              .insertGomuTvWatchlistHandler(testTvSeriesTableModel))
          .thenThrow(Exception());

      // act
      final call = tvRemoteDatasource
          .insertGomuTvWatchlistDatasource(testTvSeriesTableModel);

      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockTvDatasourceHandler
              .removeGomuTvWatchlistHandler(testTvSeriesTableModel))
          .thenAnswer((_) async => 1);

      // act
      final result = await tvRemoteDatasource
          .removeGomuTvWatchlistDatasource(testTvSeriesTableModel);

      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockTvDatasourceHandler
              .removeGomuTvWatchlistHandler(testTvSeriesTableModel))
          .thenThrow(Exception());

      // act
      final call = tvRemoteDatasource
          .removeGomuTvWatchlistDatasource(testTvSeriesTableModel);

      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get TV Series Detail By Id', () {
    final tId = 1;

    test('should return TV Series Detail Table when data is found', () async {
      // arrange
      when(mockTvDatasourceHandler.getGomuTvByIdHandler(tId))
          .thenAnswer((_) async => testTvSeriesMap);

      // act
      final result = await tvRemoteDatasource.getGomuTvByIdDatasource(tId);

      // assert
      expect(result, testTvSeriesTableModel);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockTvDatasourceHandler.getGomuTvByIdHandler(tId))
          .thenAnswer((_) async => null);

      // act
      final result = await tvRemoteDatasource.getGomuTvByIdDatasource(tId);

      // assert
      expect(result, null);
    });
  });

  group('get watchlist TV Series', () {
    test('should return list of TvSeriesTableModel from database', () async {
      // arrange
      when(mockTvDatasourceHandler.getGomuTvWatchlistHandler())
          .thenAnswer((_) async => [testTvSeriesMap]);

      // act
      final result = await tvRemoteDatasource.getGomuTvWatchlistDatasource();

      // assert
      expect(result, [testTvSeriesTableModel]);
    });
  });

  // Movie
  group('get Now Playing Movies', () {
    final tMovieList = GomuflixMovieResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_movie_now_playing.json')))
        .gomuMovieList;

    test('should return list of Movie Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_movie_now_playing.json'), 200));

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieNowPlayingDatasource();

      // assert
      expect(result, equals(tMovieList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = movieRemoteDatasource.getGomuMovieNowPlayingDatasource();

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Popular Movies', () {
    final tMovieList = GomuflixMovieResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_movie_popular.json')))
        .gomuMovieList;

    test('should return list of movies when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/popular?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_movie_popular.json'), 200));

      // act
      final result =
          await movieRemoteDatasource.getGomuMoviePopularDatasource();

      // assert
      expect(result, tMovieList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/popular?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = movieRemoteDatasource.getGomuMoviePopularDatasource();

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Top Rated Movies', () {
    final tMovieList = GomuflixMovieResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_movie_top_rated.json')))
        .gomuMovieList;

    test('should return list of movies when response code is 200 ', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_movie_top_rated.json'), 200));

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieTopRatedDatasource();

      // assert
      expect(result, tMovieList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = movieRemoteDatasource.getGomuMovieTopRatedDatasource();

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get movie detail', () {
    final tId = 1;

    final tMovieDetail = GomuflixMovieDetailModel.fromJson(
        json.decode(readJson('dummy_data/gomu_movie_detail.json')));

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/$tId?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_movie_detail.json'), 200));

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieDetailDatasource(tId);

      // assert
      expect(result, equals(tMovieDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/movie/$tId?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = movieRemoteDatasource.getGomuMovieDetailDatasource(tId);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get movie recommendations', () {
    final tMovieList = GomuflixMovieResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_movie_recommendations.json')))
        .gomuMovieList;

    final tId = 1;

    test('should return list of Movie Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/movie/$tId/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_movie_recommendations.json'), 200));

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieRecommendationDatasource(tId);

      // assert
      expect(result, equals(tMovieList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/movie/$tId/recommendations?$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call =
          movieRemoteDatasource.getGomuMovieRecommendationDatasource(tId);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search movies', () {
    final tSearchResult = GomuflixMovieResponseModel.fromJson(
            json.decode(readJson('dummy_data/gomu_movie_search.json')))
        .gomuMovieList;

    final tQuery = 'Spiderman';

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/gomu_movie_search.json'), 200));

      // act
      final result =
          await movieRemoteDatasource.searchGomuMovieDatasource(tQuery);

      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/movie?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // act
      final call = movieRemoteDatasource.searchGomuMovieDatasource(tQuery);

      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockMovieDatasourceHandler
              .insertGomuMovieWatchlistHandler(testMovieTable))
          .thenAnswer((_) async => 1);

      // act
      final result = await movieRemoteDatasource
          .insertGomuMovieWatchlistDatasource(testMovieTable);

      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockMovieDatasourceHandler
              .insertGomuMovieWatchlistHandler(testMovieTable))
          .thenThrow(Exception());

      // act
      final call = movieRemoteDatasource
          .insertGomuMovieWatchlistDatasource(testMovieTable);

      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockMovieDatasourceHandler
              .removeGomuMovieWatchlistHandler(testMovieTable))
          .thenAnswer((_) async => 1);

      // act
      final result = await movieRemoteDatasource
          .removeGomuMovieWatchlistDatasource(testMovieTable);

      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockMovieDatasourceHandler
              .removeGomuMovieWatchlistHandler(testMovieTable))
          .thenThrow(Exception());

      // act
      final call = movieRemoteDatasource
          .removeGomuMovieWatchlistDatasource(testMovieTable);

      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Movie Detail By Id', () {
    final tId = 1;

    test('should return Movie Detail Table when data is found', () async {
      // arrange
      when(mockMovieDatasourceHandler.getGomuMovieByIdHandler(tId))
          .thenAnswer((_) async => testMovieMap);

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieByIdDatasource(tId);

      // assert
      expect(result, testMovieTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockMovieDatasourceHandler.getGomuMovieByIdHandler(tId))
          .thenAnswer((_) async => null);

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieByIdDatasource(tId);

      // assert
      expect(result, null);
    });
  });

  group('get watchlist movies', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockMovieDatasourceHandler.getGomuMovieWatchlistHandler())
          .thenAnswer((_) async => [testMovieMap]);

      // act
      final result =
          await movieRemoteDatasource.getGomuMovieWatchlistDatasource();

      // assert
      expect(result, [testMovieTable]);
    });
  });
}
