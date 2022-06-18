import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/mockito.dart';

import '../../domain/handler/handler_test.mocks.dart';
import '../../dummy_data/dummy_objects.dart';

void main() {
  late GomuflixTvRepositoryImpl tvRepository;
  late MockGomuflixTvRemoteApiDatasource mockTvRemoteDatasource;

  late GomuflixMovieRepositoryImpl movieRepository;
  late MockGomuflixMovieRemoteDatasource mockMovieRemoteDatasource;

  setUp(() {
    mockTvRemoteDatasource = MockGomuflixTvRemoteApiDatasource();
    tvRepository =
        GomuflixTvRepositoryImpl(remoteTvDatasource: mockTvRemoteDatasource);

    mockMovieRemoteDatasource = MockGomuflixMovieRemoteDatasource();
    movieRepository = GomuflixMovieRepositoryImpl(
        remoteMovieDataSource: mockMovieRemoteDatasource);
  });

  // Tv Json
  final tTvSeriesModel = GomuflixTvModel(
      backdropPath: '/gFZriCkpJYsApPZEF3jhxL4yLzG.jpg',
      genreIds: [80, 18],
      id: 71446,
      originalName: 'La Casa de Papel',
      overview:
          'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.',
      popularity: 906.295,
      posterPath: '/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
      firstAirDate: '2017-05-02',
      name: 'Money Heist',
      voteAverage: 8.3,
      voteCount: 14669);

  final tTv = GomuflixTvEntity(
      backdropPath: '/gFZriCkpJYsApPZEF3jhxL4yLzG.jpg',
      genreIds: [80, 18],
      id: 71446,
      originalName: 'La Casa de Papel',
      overview:
          'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.',
      popularity: 906.295,
      posterPath: '/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
      firstAirDate: '2017-05-02',
      name: 'Money Heist',
      voteAverage: 8.3,
      voteCount: 14669);

  final tMovieModel = GomuflixMovieModel(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tMovie = GomuflixMovieEntity(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tTvSeriesModelList = <GomuflixTvModel>[tTvSeriesModel];
  final tTvList = <GomuflixTvEntity>[tTv];
  final tMovieModelList = <GomuflixMovieModel>[tMovieModel];
  final tMovieList = <GomuflixMovieEntity>[tMovie];

  // Tv Test
  group('Now Playing TV Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvOnAirDatasource())
          .thenAnswer((_) async => tTvSeriesModelList);

      // act
      final result = await tvRepository.getGomuflixTvOnAirAct();

      // assert
      verify(mockTvRemoteDatasource.getGomuTvOnAirDatasource());

      final resultList = result.getOrElse(() => []);

      expect(resultList, tTvList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvOnAirDatasource())
          .thenThrow(ServerException());

      // act
      final result = await tvRepository.getGomuflixTvOnAirAct();

      // assert
      verify(mockTvRemoteDatasource.getGomuTvOnAirDatasource());

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvOnAirDatasource())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await tvRepository.getGomuflixTvOnAirAct();
      // assert
      verify(mockTvRemoteDatasource.getGomuTvOnAirDatasource());
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvOnAirDatasource())
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await tvRepository.getGomuflixTvOnAirAct();
      // assert
      verify(mockTvRemoteDatasource.getGomuTvOnAirDatasource());
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Popular TV Series', () {
    test('should return TV Serieslist when call to data source is success',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvPopularDatasource())
          .thenAnswer((_) async => tTvSeriesModelList);

      // act
      final result = await tvRepository.getGomuflixTvPopularAct();

      // assert
      final resultList = result.getOrElse(() => []);

      expect(resultList, tTvList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvPopularDatasource())
          .thenThrow(ServerException());

      // act
      final result = await tvRepository.getGomuflixTvPopularAct();

      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvPopularDatasource())
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await tvRepository.getGomuflixTvPopularAct();

      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvPopularDatasource())
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await tvRepository.getGomuflixTvPopularAct();
      // assert
      verify(mockTvRemoteDatasource.getGomuTvPopularDatasource());
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Top Rated TV Series', () {
    test('should return TV Serieslist when call to data source is successful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvTopRatedDatasource())
          .thenAnswer((_) async => tTvSeriesModelList);

      // act
      final result = await tvRepository.getGomuflixTvTopRatedAct();

      // assert
      final resultList = result.getOrElse(() => []);

      expect(resultList, tTvList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvTopRatedDatasource())
          .thenThrow(ServerException());

      // act
      final result = await tvRepository.getGomuflixTvTopRatedAct();

      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvTopRatedDatasource())
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await tvRepository.getGomuflixTvTopRatedAct();

      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvTopRatedDatasource())
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await tvRepository.getGomuflixTvTopRatedAct();
      // assert
      verify(mockTvRemoteDatasource.getGomuTvTopRatedDatasource());
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Get TV Series Detail', () {
    final tId = 1;

    final tTvResponse = GomuflixTvDetailModel(
      backdropPath: 'backdropPath',
      genres: [GomuflixTvGenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      originalLanguage: 'en',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      firstAirDate: 'firstAirDate',
      status: 'Status',
      tagline: 'Tagline',
      name: 'name',
      numberOfEpisodes: 1,
      numberOfSeasons: 1,
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return TV Series data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId))
          .thenAnswer((_) async => tTvResponse);

      // act
      final result = await tvRepository.getGomuflixTvDetailAct(tId);

      // assert
      verify(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId));

      expect(result, equals(Right(testTvSeriesDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId))
          .thenThrow(ServerException());

      // act
      final result = await tvRepository.getGomuflixTvDetailAct(tId);

      // assert
      verify(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId));

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId))
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await tvRepository.getGomuflixTvDetailAct(tId);

      // assert
      verify(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId));

      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId))
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await tvRepository.getGomuflixTvDetailAct(tId);
      // assert
      verify(mockTvRemoteDatasource.getGomuTvDetailDatasource(tId));
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Get TV Series Recommendations', () {
    final tTvList = <GomuflixTvModel>[];

    final tId = 1;

    test('should return data (TV Serieslist) when the call is successful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId))
          .thenAnswer((_) async => tTvList);

      // act
      final result = await tvRepository.getGomuflixTvRecommendationAct(tId);

      // assert
      verify(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId));

      final resultList = result.getOrElse(() => []);

      expect(resultList, equals(tTvList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId))
          .thenThrow(ServerException());

      // act
      final result = await tvRepository.getGomuflixTvRecommendationAct(tId);

      // assertbuild runner
      verify(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId));

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId))
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await tvRepository.getGomuflixTvRecommendationAct(tId);

      // assert
      verify(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId));

      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId))
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await tvRepository.getGomuflixTvRecommendationAct(tId);

      // assert
      verify(mockTvRemoteDatasource.getGomuTvRecommendationDatasource(tId));
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Seach TV Series', () {
    final tQuery = 'spiderman';

    test('should return TV Serieslist when call to data source is successful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.searchGomuTvDatasource(tQuery))
          .thenAnswer((_) async => tTvSeriesModelList);

      // act
      final result = await tvRepository.searchGomuflixTvAct(tQuery);

      // assert
      final resultList = result.getOrElse(() => []);

      expect(resultList, tTvList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvRemoteDatasource.searchGomuTvDatasource(tQuery))
          .thenThrow(ServerException());

      // act
      final result = await tvRepository.searchGomuflixTvAct(tQuery);

      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvRemoteDatasource.searchGomuTvDatasource(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await tvRepository.searchGomuflixTvAct(tQuery);

      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockTvRemoteDatasource.searchGomuTvDatasource(tQuery))
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await tvRepository.searchGomuflixTvAct(tQuery);

      // assert
      verify(mockTvRemoteDatasource.searchGomuTvDatasource(tQuery));
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockTvRemoteDatasource
              .insertGomuTvWatchlistDatasource(testTvSeriesTableModel))
          .thenAnswer((_) async => 'Added to Watchlist');

      // act
      final result = await tvRepository.saveGomuflixTvAct(testTvSeriesDetail);

      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockTvRemoteDatasource
              .insertGomuTvWatchlistDatasource(testTvSeriesTableModel))
          .thenThrow(DatabaseException('Failed to add watchlist'));

      // act
      final result = await tvRepository.saveGomuflixTvAct(testTvSeriesDetail);

      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockTvRemoteDatasource
              .removeGomuTvWatchlistDatasource(testTvSeriesTableModel))
          .thenAnswer((_) async => 'Removed from watchlist');

      // act
      final result = await tvRepository.removeGomuflixTvAct(testTvSeriesDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockTvRemoteDatasource
              .removeGomuTvWatchlistDatasource(testTvSeriesTableModel))
          .thenThrow(DatabaseException('Failed to remove watchlist'));

      // act
      final result = await tvRepository.removeGomuflixTvAct(testTvSeriesDetail);

      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;

      when(mockTvRemoteDatasource.getGomuTvByIdDatasource(tId))
          .thenAnswer((_) async => null);

      // act
      final result = await tvRepository.isAddedToWatchlist(tId);

      // assert
      expect(result, false);
    });
  });

  // group('get watchlist TV Series', () {
  //   test('should return list of TV Series', () async {
  //     // arrange
  //     when(mockTvRemoteDatasource.getGomuTvWatchlistDatasource())
  //         .thenAnswer((_) async => [testTvSeriesTableModel]);

  //     // act
  //     final result = await tvRepository.getGomuflixTvWatchlistAct();

  //     // assert
  //     final resultList = result.getOrElse(() => []);

  //     expect(resultList, [testWatchlistTvSeries]);
  //   });
  // });

  // Movie Test
  group('Now Playing Movies', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource())
          .thenAnswer((_) async => tMovieModelList);

      // act
      final result = await movieRepository.getGomuflixMovieNowPlayingAct();

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource());

      final resultList = result.getOrElse(() => []);

      expect(resultList, tMovieList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource())
          .thenThrow(ServerException());

      // act
      final result = await movieRepository.getGomuflixMovieNowPlayingAct();

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource());

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource())
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await movieRepository.getGomuflixMovieNowPlayingAct();

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource());

      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource())
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await movieRepository.getGomuflixMovieNowPlayingAct();

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieNowPlayingDatasource());
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Popular Movies', () {
    test('should return movie list when call to data source is success',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMoviePopularDatasource())
          .thenAnswer((_) async => tMovieModelList);

      // act
      final result = await movieRepository.getGomuflixMoviePopularAct();

      // assert
      final resultList = result.getOrElse(() => []);

      expect(resultList, tMovieList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMoviePopularDatasource())
          .thenThrow(ServerException());

      // act
      final result = await movieRepository.getGomuflixMoviePopularAct();

      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMoviePopularDatasource())
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await movieRepository.getGomuflixMoviePopularAct();

      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMoviePopularDatasource())
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await movieRepository.getGomuflixMoviePopularAct();

      // assert
      verify(mockMovieRemoteDatasource.getGomuMoviePopularDatasource());
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Top Rated Movies', () {
    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieTopRatedDatasource())
          .thenAnswer((_) async => tMovieModelList);

      // act
      final result = await movieRepository.getGomuflixMovieTopRatedAct();

      // assert
      final resultList = result.getOrElse(() => []);

      expect(resultList, tMovieList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieTopRatedDatasource())
          .thenThrow(ServerException());

      // act
      final result = await movieRepository.getGomuflixMovieTopRatedAct();

      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieTopRatedDatasource())
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await movieRepository.getGomuflixMovieTopRatedAct();

      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieTopRatedDatasource())
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await movieRepository.getGomuflixMovieTopRatedAct();

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieTopRatedDatasource());
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Get Movie Detail', () {
    final tId = 1;
    final tMovieResponse = GomuflixMovieDetailModel(
      adult: false,
      backdropPath: 'backdropPath',
      budget: 100,
      genres: [GomuflixMovieGenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      imdbId: 'imdb1',
      originalLanguage: 'en',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      revenue: 12000,
      runtime: 120,
      status: 'Status',
      tagline: 'Tagline',
      title: 'title',
      video: false,
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return Movie data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId))
          .thenAnswer((_) async => tMovieResponse);

      // act
      final result = await movieRepository.getGomuflixMovieDetailAct(tId);

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId));

      expect(result, equals(Right(testMovieDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId))
          .thenThrow(ServerException());

      // act
      final result = await movieRepository.getGomuflixMovieDetailAct(tId);

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId));

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId))
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await movieRepository.getGomuflixMovieDetailAct(tId);

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId));

      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId))
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await movieRepository.getGomuflixMovieDetailAct(tId);

      // assert
      verify(mockMovieRemoteDatasource.getGomuMovieDetailDatasource(tId));
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Get Movie Recommendations', () {
    final tMovieList = <GomuflixMovieModel>[];

    final tId = 1;

    test('should return data (movie list) when the call is successful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId))
          .thenAnswer((_) async => tMovieList);

      // act
      final result =
          await movieRepository.getGomuflixMovieRecommendationAct(tId);

      // assert
      verify(
          mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId));

      final resultList = result.getOrElse(() => []);

      expect(resultList, equals(tMovieList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId))
          .thenThrow(ServerException());

      // act
      final result =
          await movieRepository.getGomuflixMovieRecommendationAct(tId);

      // assertbuild runner
      verify(
          mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId));

      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId))
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result =
          await movieRepository.getGomuflixMovieRecommendationAct(tId);

      // assert
      verify(
          mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId));

      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId))
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result =
          await movieRepository.getGomuflixMovieRecommendationAct(tId);

      // assert
      verify(
          mockMovieRemoteDatasource.getGomuMovieRecommendationDatasource(tId));
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('Seach Movies', () {
    final tQuery = 'spiderman';

    test('should return movie list when call to data source is successful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.searchGomuMovieDatasource(tQuery))
          .thenAnswer((_) async => tMovieModelList);

      // act
      final result = await movieRepository.searchGomuflixMovieAct(tQuery);

      // assert
      final resultList = result.getOrElse(() => []);

      expect(resultList, tMovieList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.searchGomuMovieDatasource(tQuery))
          .thenThrow(ServerException());

      // act
      final result = await movieRepository.searchGomuflixMovieAct(tQuery);

      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.searchGomuMovieDatasource(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));

      // act
      final result = await movieRepository.searchGomuflixMovieAct(tQuery);

      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });

    test(
        'should return ssl failure when the device is not have valid certificate',
        () async {
      // arrange
      when(mockMovieRemoteDatasource.searchGomuMovieDatasource(tQuery))
          .thenThrow(TlsException('Certificate Invalid'));
      // act
      final result = await movieRepository.searchGomuflixMovieAct(tQuery);

      // assert
      verify(mockMovieRemoteDatasource.searchGomuMovieDatasource(tQuery));
      expect(result, equals(Left(SslFailure('Certificate Invalid'))));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockMovieRemoteDatasource
              .insertGomuMovieWatchlistDatasource(testMovieTable))
          .thenAnswer((_) async => 'Added to Watchlist');

      // act
      final result =
          await movieRepository.saveGomuflixMovieWatchlistAct(testMovieDetail);

      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockMovieRemoteDatasource
              .insertGomuMovieWatchlistDatasource(testMovieTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));

      // act
      final result =
          await movieRepository.saveGomuflixMovieWatchlistAct(testMovieDetail);

      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockMovieRemoteDatasource
              .removeGomuMovieWatchlistDatasource(testMovieTable))
          .thenAnswer((_) async => 'Removed from watchlist');

      // act
      final result = await movieRepository
          .removeGomuflixMovieWatchlistAct(testMovieDetail);

      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockMovieRemoteDatasource
              .removeGomuMovieWatchlistDatasource(testMovieTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));

      // act
      final result = await movieRepository
          .removeGomuflixMovieWatchlistAct(testMovieDetail);

      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockMovieRemoteDatasource.getGomuMovieByIdDatasource(tId))
          .thenAnswer((_) async => null);

      // act
      final result = await movieRepository.isAddedToWatchlist(tId);

      // assert
      expect(result, false);
    });
  });

  // group('get watchlist movies', () {
  //   test('should return list of Movies', () async {
  //     // arrange
  //     when(mockMovieRemoteDatasource.getGomuMovieWatchlistDatasource())
  //         .thenAnswer((_) async => [testMovieTable]);

  //     // act
  //     final result = await movieRepository.getGomuflixMovieWatchlistAct();

  //     // assert
  //     final resultList = result.getOrElse(() => []);

  //     expect(resultList, [testWatchlistMovie]);
  //   });
  // });
}
