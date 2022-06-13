import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_tv_watchlist_bloc_test.mocks.dart';

@GenerateMocks([
  GomuTvWatchlistBloc,
  GetGomuflixTvWatchlistCase,
  GetGomuflixTvWatchlistStatusCase,
  SaveGomuflixTvWatchlistCase,
  RemoveGomuflixTvWatchlistCase
])
void main() {
  // Declrate Variables
  late GomuTvWatchlistBloc gomuTvWatchlistBloc;

  late MockGetGomuflixTvWatchlistCase mockGetGomuflixTvWatchlistCase;

  late MockGetGomuflixTvWatchlistStatusCase
      mockGetGomuflixTvWatchlistStatusCase;

  late MockSaveGomuflixTvWatchlistCase mockSaveGomuflixTvWatchlistCase;

  late MockRemoveGomuflixTvWatchlistCase mockRemoveGomuflixTvWatchlistCase;

  const testTvId = 1;

  // Set Up
  setUp(
    () {
      // Case
      mockGetGomuflixTvWatchlistCase = MockGetGomuflixTvWatchlistCase();

      mockGetGomuflixTvWatchlistStatusCase =
          MockGetGomuflixTvWatchlistStatusCase();

      mockSaveGomuflixTvWatchlistCase = MockSaveGomuflixTvWatchlistCase();

      mockRemoveGomuflixTvWatchlistCase = MockRemoveGomuflixTvWatchlistCase();

      // Bloc
      gomuTvWatchlistBloc = GomuTvWatchlistBloc(
          mockGetGomuflixTvWatchlistCase,
          mockGetGomuflixTvWatchlistStatusCase,
          mockSaveGomuflixTvWatchlistCase,
          mockRemoveGomuflixTvWatchlistCase);
    },
  );

  // Test
  test(
    'initial state in watchlist movies should be empty',
    () {
      expect(gomuTvWatchlistBloc.state, GomuTvWatchlistInitial());
    },
  );

  group('Get Watchlist Tv', () {
    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'Should emit [Loading, Loaded] when data is added',
        build: () {
          when(mockGetGomuflixTvWatchlistCase.watchlistAction())
              .thenAnswer((_) async => Right(testWatchlistTvSeriesList));

          return gomuTvWatchlistBloc;
        },
        act: (bloc) async => bloc.add(GomuTvGetListEvent()),
        expect: () => [
              GomuTvWatchlistLoading(),
              GomuTvWatchlistLoaded(testWatchlistTvSeriesList),
            ],
        verify: (bloc) {
          verify(mockGetGomuflixTvWatchlistCase.watchlistAction());

          return GomuTvGetListEvent().props;
        });

    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Error] when data is not added',
        build: () {
          when(mockGetGomuflixTvWatchlistCase.watchlistAction()).thenAnswer(
              (_) async => const Left(ServerFailure('Server is Failure')));

          return gomuTvWatchlistBloc;
        },
        act: (bloc) async => bloc.add(GomuTvGetListEvent()),
        expect: () => [
              GomuTvWatchlistLoading(),
              GomuTvWatchlistError('Server is Failure'),
            ],
        verify: (bloc) {
          verify(mockGetGomuflixTvWatchlistCase.watchlistAction());

          return GomuTvGetListEvent().props;
        });
  });

  group('Get Watchlist Status', () {
    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Loaded] when data is added',
        build: () {
          when(mockGetGomuflixTvWatchlistStatusCase
                  .watchlistStatusAction(testTvId))
              .thenAnswer((_) async => true);

          return gomuTvWatchlistBloc;
        },
        act: (bloc) async =>
            bloc.add(GomuTvWatchlistEventLoadWatchlistStatus(testTvId)),
        expect: () => [
              GomuTvWatchlistLoading(),
              GomuTvStatusLoaded(true),
            ],
        verify: (bloc) {
          verify(mockGetGomuflixTvWatchlistStatusCase
              .watchlistStatusAction(testTvId));

          return GomuTvWatchlistEventLoadWatchlistStatus(testTvId).props;
        });
    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Error] when get watchlist status is not added',
        build: () {
          when(mockGetGomuflixTvWatchlistStatusCase
                  .watchlistStatusAction(testTvId))
              .thenAnswer((_) async => false);

          return gomuTvWatchlistBloc;
        },
        act: (bloc) =>
            bloc.add(GomuTvWatchlistEventLoadWatchlistStatus(testTvId)),
        expect: () => [
              GomuTvWatchlistLoading(),
              GomuTvStatusLoaded(false),
            ],
        verify: (bloc) {
          verify(mockGetGomuflixTvWatchlistStatusCase
              .watchlistStatusAction(testTvId));

          return GomuTvWatchlistEventLoadWatchlistStatus(testTvId).props;
        });
  });

  group('Save Watchlist Tv', () {
    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Loaded] when data is added',
        build: () {
          when(mockSaveGomuflixTvWatchlistCase
                  .saveWatchlistAction(testTvSeriesDetail))
              .thenAnswer((_) async => const Right('Success add to watchlist'));

          return gomuTvWatchlistBloc;
        },
        act: (bloc) =>
            bloc.add(GomuTvWatchlistEventAddToWatchlist(testTvSeriesDetail)),
        expect: () => [
              GomuTvSuccess('Success add to watchlist'),
            ],
        verify: (bloc) {
          verify(mockSaveGomuflixTvWatchlistCase
              .saveWatchlistAction(testTvSeriesDetail));

          return GomuTvWatchlistEventAddToWatchlist(testTvSeriesDetail).props;
        });

    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Error] when data is not added',
        build: () {
          when(mockSaveGomuflixTvWatchlistCase
                  .saveWatchlistAction(testTvSeriesDetail))
              .thenAnswer(
                  (_) async => const Left(DatabaseFailure('add data Failed')));

          return gomuTvWatchlistBloc;
        },
        act: (bloc) =>
            bloc.add(GomuTvWatchlistEventAddToWatchlist(testTvSeriesDetail)),
        expect: () => [
              GomuTvWatchlistError('add data Failed'),
            ],
        verify: (bloc) {
          verify(mockSaveGomuflixTvWatchlistCase
              .saveWatchlistAction(testTvSeriesDetail));

          return GomuTvWatchlistEventAddToWatchlist(testTvSeriesDetail).props;
        });
  });

  group('Remove Watchlist Tv', () {
    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Removed] when data is Removed',
        build: () {
          when(mockRemoveGomuflixTvWatchlistCase
                  .removeWatchlistAction(testTvSeriesDetail))
              .thenAnswer(
                  (_) async => const Right('Success remove from watchlist'));

          return gomuTvWatchlistBloc;
        },
        act: (bloc) => bloc
            .add(GomuTvWatchlistEventRemoveFromWatchlist(testTvSeriesDetail)),
        expect: () => [
              GomuTvSuccess('Success remove from watchlist'),
            ],
        verify: (bloc) {
          verify(mockRemoveGomuflixTvWatchlistCase
              .removeWatchlistAction(testTvSeriesDetail));

          return GomuTvWatchlistEventRemoveFromWatchlist(testTvSeriesDetail)
              .props;
        });

    blocTest<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        'should emit [Loading, Error] when data is not Removed',
        build: () {
          when(mockRemoveGomuflixTvWatchlistCase
                  .removeWatchlistAction(testTvSeriesDetail))
              .thenAnswer((_) async =>
                  const Left(DatabaseFailure('Remove Data Failed')));

          return gomuTvWatchlistBloc;
        },
        act: (bloc) => bloc
            .add(GomuTvWatchlistEventRemoveFromWatchlist(testTvSeriesDetail)),
        expect: () => [
              GomuTvWatchlistError('Remove Data Failed'),
            ],
        verify: (bloc) {
          verify(mockRemoveGomuflixTvWatchlistCase
              .removeWatchlistAction(testTvSeriesDetail));

          return GomuTvWatchlistEventRemoveFromWatchlist(testTvSeriesDetail)
              .props;
        });
  });
}
