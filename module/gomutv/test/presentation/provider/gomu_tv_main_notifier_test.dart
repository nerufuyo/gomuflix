import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_tv_main_notifier_test.mocks.dart';

@GenerateMocks([GetGomuflixTvListCase, GetGomuflixTvWatchlistCase])
void main() {
  late GomuflixTvListNotifier tvListProvider;

  late MockGetGomuflixTvListCase mockGetTvList;

  late MockGetGomuflixTvWatchlistCase mockGetTvWatchlist;

  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;

    mockGetTvList = MockGetGomuflixTvListCase();

    mockGetTvWatchlist = MockGetGomuflixTvWatchlistCase();

    tvListProvider = GomuflixTvListNotifier(
      getGomuTvOnAirCase: mockGetTvList,
      getGomuTvPopularCase: mockGetTvList,
      getGomuTvTopRatedCase: mockGetTvList,
      getGomuTvWatchlistCase: mockGetTvWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTv = GomuflixTvEntity(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    voteAverage: 1.0,
    voteCount: 1,
    name: 'name',
  );
  final tTvList = <GomuflixTvEntity>[tTv];

  // Tv On Air
  group('now playing TV Series', () {
    test('initialState should be Empty', () {
      expect(tvListProvider.gomuTvOnAirState, equals(RequestState.empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetTvList.onAirAction()).thenAnswer((_) async => Right(tTvList));

      // act
      tvListProvider.syncGomuTvOnAir();

      // assert
      verify(mockGetTvList.onAirAction());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetTvList.onAirAction()).thenAnswer((_) async => Right(tTvList));

      // act
      tvListProvider.syncGomuTvOnAir();

      // assert
      expect(tvListProvider.gomuTvOnAirState, RequestState.loading);
    });

    test('should change TV Series when data is gotten successfully', () async {
      // arrange
      when(mockGetTvList.onAirAction()).thenAnswer((_) async => Right(tTvList));

      // act
      await tvListProvider.syncGomuTvOnAir();

      // assert
      expect(tvListProvider.gomuTvOnAirState, RequestState.loaded);

      expect(tvListProvider.onAirTv, tTvList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvList.onAirAction())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await tvListProvider.syncGomuTvOnAir();

      // assert
      expect(tvListProvider.gomuTvOnAirState, RequestState.error);

      expect(tvListProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });

  // Tv Popular
  group('popular TV Series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTvList.popularAction())
          .thenAnswer((_) async => Right(tTvList));

      // act
      tvListProvider.syncGomuTvPopular();

      // assert
      expect(tvListProvider.gomuTvPopularState, RequestState.loading);
    });

    test('should change TV Series data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTvList.popularAction())
          .thenAnswer((_) async => Right(tTvList));

      // act
      await tvListProvider.syncGomuTvPopular();

      // assert
      expect(tvListProvider.gomuTvPopularState, RequestState.loaded);

      expect(tvListProvider.popularTv, tTvList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvList.popularAction())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await tvListProvider.syncGomuTvPopular();

      // assert
      expect(tvListProvider.gomuTvPopularState, RequestState.error);

      expect(tvListProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });

  // Tv Top Rated
  group('top rated TV Series', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTvList.topRatedAction())
          .thenAnswer((_) async => Right(tTvList));

      // act
      tvListProvider.syncGomuTvTopRated();

      // assert
      expect(tvListProvider.gomuTvTopRatedState, RequestState.loading);
    });

    test('should change TV Series data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTvList.topRatedAction())
          .thenAnswer((_) async => Right(tTvList));

      // act
      await tvListProvider.syncGomuTvTopRated();

      // assert
      expect(tvListProvider.gomuTvTopRatedState, RequestState.loaded);

      expect(tvListProvider.topRatedTv, tTvList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvList.topRatedAction())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await tvListProvider.syncGomuTvTopRated();

      // assert
      expect(tvListProvider.gomuTvTopRatedState, RequestState.error);

      expect(tvListProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });

  // Tv Watchlist
  test('should change TV Series data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetTvWatchlist.watchlistAction())
        .thenAnswer((_) async => Right([testWatchlistTvSeries]));

    // act
    await tvListProvider.syncGomuTvWatchlist();
    // assert
    expect(tvListProvider.gomuTvWatchlistState, RequestState.loaded);

    expect(tvListProvider.watchlistTv, [testWatchlistTvSeries]);

    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTvWatchlist.watchlistAction())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));

    // act
    await tvListProvider.syncGomuTvWatchlist();
    // assert
    expect(tvListProvider.gomuTvWatchlistState, RequestState.error);

    expect(tvListProvider.message, "Can't get data");

    expect(listenerCallCount, 2);
  });
}
