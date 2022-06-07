import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_tv_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetGomuflixTvDetailCase,
  GetGomuflixTvWatchlistCase,
  SaveGomuflixTvWatchlistCase,
  RemoveGomuflixTvWatchlistCase
])
void main() {
  late GomuflixTvDetailNotifier tvProvider;

  late MockGetGomuflixTvDetailCase mockGetDetail;

  late MockGetGomuflixTvWatchlistCase mockGetWatchlist;

  late MockSaveGomuflixTvWatchlistCase mockSaveWatchlist;

  late MockRemoveGomuflixTvWatchlistCase mockRemoveWatchlist;

  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;

    mockGetDetail = MockGetGomuflixTvDetailCase();

    mockGetWatchlist = MockGetGomuflixTvWatchlistCase();

    mockSaveWatchlist = MockSaveGomuflixTvWatchlistCase();

    mockRemoveWatchlist = MockRemoveGomuflixTvWatchlistCase();

    tvProvider = GomuflixTvDetailNotifier(
      getGomuTvDetail: mockGetDetail,
      getGomuTvRecommendation: mockGetDetail,
      getGomuTvWatchlistStatus: mockGetWatchlist,
      removeGomuTvWatchlist: mockRemoveWatchlist,
      saveGomuTvWatchlist: mockSaveWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

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
  final tTvs = <GomuflixTvEntity>[tTv];

  void _arrangeUsecase() {
    when(mockGetDetail.detailAction(tId))
        .thenAnswer((_) async => Right(testTvSeriesDetail));

    when(mockGetDetail.recommendationAction(tId))
        .thenAnswer((_) async => Right(tTvs));
  }

  // Tv Detail
  group('Get TV Series Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      verify(mockGetDetail.detailAction(tId));

      verify(mockGetDetail.recommendationAction(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();

      // act
      tvProvider.syncGomuTvDetail(tId);

      // assert
      expect(tvProvider.tvState, RequestState.loading);

      expect(listenerCallCount, 1);
    });

    test('should change TV Series when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      expect(tvProvider.tvState, RequestState.loaded);

      expect(tvProvider.tv, testTvSeriesDetail);

      expect(listenerCallCount, 3);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      expect(tvProvider.tvState, RequestState.loaded);

      expect(tvProvider.tvRecommendations, tTvs);
    });
  });

  // Tv Recommendation
  group('Get TV Series Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      verify(mockGetDetail.recommendationAction(tId));

      expect(tvProvider.tvRecommendations, tTvs);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      expect(tvProvider.recommendationState, RequestState.loaded);

      expect(tvProvider.tvRecommendations, tTvs);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetDetail.detailAction(tId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));

      when(mockGetDetail.recommendationAction(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      expect(tvProvider.recommendationState, RequestState.loaded);

      expect(tvProvider.message, 'Failed');
    });
  });

  // Get Watchlist
  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchlist.watchlistStatusAction(1))
          .thenAnswer((_) async => true);

      // act
      await tvProvider.loadWatchlistStatus(1);

      // assert
      expect(tvProvider.isAddedToWatchlist, true);
    });

    // Save Watchlist
    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlist.saveWatchlistAction(testTvSeriesDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetWatchlist.watchlistStatusAction(testTvSeriesDetail.id))
          .thenAnswer((_) async => true);

      // act
      await tvProvider.syncGomuTvAddWatchlist(testTvSeriesDetail);

      // assert
      verify(mockSaveWatchlist.saveWatchlistAction(testTvSeriesDetail));
    });

    // Remove Watchlist
    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist.removeWatchlistAction(testTvSeriesDetail))
          .thenAnswer((_) async => Right('Removed'));

      when(mockGetWatchlist.watchlistStatusAction(testTvSeriesDetail.id))
          .thenAnswer((_) async => false);

      // act
      await tvProvider.syncGomuTvRemoveWatchlist(testTvSeriesDetail);

      // assert
      verify(mockRemoveWatchlist.removeWatchlistAction(testTvSeriesDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlist.saveWatchlistAction(testTvSeriesDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));

      when(mockGetWatchlist.watchlistStatusAction(testTvSeriesDetail.id))
          .thenAnswer((_) async => true);

      // act
      await tvProvider.syncGomuTvAddWatchlist(testTvSeriesDetail);

      // assert
      verify(mockGetWatchlist.watchlistStatusAction(testTvSeriesDetail.id));

      expect(tvProvider.isAddedToWatchlist, true);

      expect(tvProvider.watchlistMessage, 'Added to Watchlist');

      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlist.saveWatchlistAction(testTvSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));

      when(mockGetWatchlist.watchlistStatusAction(testTvSeriesDetail.id))
          .thenAnswer((_) async => false);

      // act
      await tvProvider.syncGomuTvAddWatchlist(testTvSeriesDetail);

      // assert
      expect(tvProvider.watchlistMessage, 'Failed');

      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetDetail.detailAction(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetDetail.recommendationAction(tId))
          .thenAnswer((_) async => Right(tTvs));

      // act
      await tvProvider.syncGomuTvDetail(tId);

      // assert
      expect(tvProvider.tvState, RequestState.error);

      expect(tvProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });
}
