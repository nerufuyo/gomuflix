import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_movie_watchlist_bloc_test.mocks.dart';

@GenerateMocks([
  GomuMovieWatchlistBloc,
  GetGomuflixMovieWatchlistCase,
  GetGomuflixMovieWatchlistStatusCase,
  SaveGomuflixMoviewatchlist,
  RemoveGomuflixMoviewatchlist,
])
void main() {
  // Declarate Variable
  late GomuMovieWatchlistBloc gomuMovieWatchlistBloc;

  late MockGetGomuflixMovieWatchlistCase mockGetGomuMovieWatchlistCase;

  late MockGetGomuflixMovieWatchlistStatusCase
      mockGetGomuMovieWatchlistStatusCase;

  late MockSaveGomuflixMoviewatchlist mockSaveGomuMovieWatchlistCase;

  late MockRemoveGomuflixMoviewatchlist mockRemoveGomuMovieWatchlistCase;

  const testMovieId = 1;

  setUp(() {
    mockGetGomuMovieWatchlistCase = MockGetGomuflixMovieWatchlistCase();

    mockGetGomuMovieWatchlistStatusCase =
        MockGetGomuflixMovieWatchlistStatusCase();

    mockSaveGomuMovieWatchlistCase = MockSaveGomuflixMoviewatchlist();

    mockRemoveGomuMovieWatchlistCase = MockRemoveGomuflixMoviewatchlist();

    gomuMovieWatchlistBloc = GomuMovieWatchlistBloc(
      mockGetGomuMovieWatchlistCase,
      mockGetGomuMovieWatchlistStatusCase,
      mockSaveGomuMovieWatchlistCase,
      mockRemoveGomuMovieWatchlistCase,
    );
  });

  // Test
  test(
    'initial state in watchlist movies should be empty',
    () {
      expect(gomuMovieWatchlistBloc.state, GomuMovieWatchlistInitial());
    },
  );

  group('Get Watchlist Movie', () {
    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'Should emit [Loading, Loaded] when data is added',
        build: () {
          when(mockGetGomuMovieWatchlistCase.watchlistAction())
              .thenAnswer((_) async => Right(testMovieList));

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) async => bloc.add(GomuMovieGetListEvent()),
        expect: () => [
              GomuMovieWatchlistLoading(),
              GomuMovieWatchlistLoaded(testMovieList),
            ],
        verify: (bloc) {
          verify(mockGetGomuMovieWatchlistCase.watchlistAction());

          return GomuMovieGetListEvent().props;
        });

    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Error] when data is not added',
        build: () {
          when(mockGetGomuMovieWatchlistCase.watchlistAction()).thenAnswer(
              (_) async => const Left(ServerFailure('Server is Failure')));

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) async => bloc.add(GomuMovieGetListEvent()),
        expect: () => [
              GomuMovieWatchlistLoading(),
              GomuMovieWatchlistError('Server is Failure'),
            ],
        verify: (bloc) {
          verify(mockGetGomuMovieWatchlistCase.watchlistAction());

          return GomuMovieGetListEvent().props;
        });
  });

  group('Get Watchlist Status', () {
    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Loaded] when data is added',
        build: () {
          when(mockGetGomuMovieWatchlistStatusCase.execute(testMovieId))
              .thenAnswer((_) async => true);

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) async => bloc.add(GomuMovieGetStatusEvent(testMovieId)),
        expect: () => [
              GomuMovieWatchlistLoading(),
              GomuMovieStatusLoaded(true),
            ],
        verify: (bloc) {
          verify(mockGetGomuMovieWatchlistStatusCase.execute(testMovieId));

          return GomuMovieGetStatusEvent(testMovieId).props;
        });
    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Error] when get watchlist status is not added',
        build: () {
          when(mockGetGomuMovieWatchlistStatusCase.execute(testMovieId))
              .thenAnswer((_) async => false);

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) => bloc.add(GomuMovieGetStatusEvent(testMovieId)),
        expect: () => [
              GomuMovieWatchlistLoading(),
              GomuMovieStatusLoaded(false),
            ],
        verify: (bloc) {
          verify(mockGetGomuMovieWatchlistStatusCase.execute(testMovieId));

          return GomuMovieGetStatusEvent(testMovieId).props;
        });
  });

  group('Save Watchlist Movie', () {
    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Loaded] when data is added',
        build: () {
          when(mockSaveGomuMovieWatchlistCase
                  .saveWatchlisAction(testMovieDetail))
              .thenAnswer((_) async => const Right('Success add to watchlist'));

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) => bloc.add(GomuMovieSaveEvent(testMovieDetail)),
        expect: () => [
              GomuMovieSuccess('Success add to watchlist'),
            ],
        verify: (bloc) {
          verify(mockSaveGomuMovieWatchlistCase
              .saveWatchlisAction(testMovieDetail));

          return GomuMovieSaveEvent(testMovieDetail).props;
        });

    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Error] when data is not added',
        build: () {
          when(mockSaveGomuMovieWatchlistCase
                  .saveWatchlisAction(testMovieDetail))
              .thenAnswer(
                  (_) async => const Left(DatabaseFailure('add data Failed')));

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) => bloc.add(GomuMovieSaveEvent(testMovieDetail)),
        expect: () => [
              GomuMovieWatchlistError('add data Failed'),
            ],
        verify: (bloc) {
          verify(mockSaveGomuMovieWatchlistCase
              .saveWatchlisAction(testMovieDetail));

          return GomuMovieSaveEvent(testMovieDetail).props;
        });
  });

  group('Remove Watchlist Movie', () {
    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Removed] when data is Removed',
        build: () {
          when(mockRemoveGomuMovieWatchlistCase
                  .removeWatchlisAction(testMovieDetail))
              .thenAnswer(
                  (_) async => const Right('Success remove from watchlist'));

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) => bloc.add(GomuMovieRemoveEvent(testMovieDetail)),
        expect: () => [
              GomuMovieSuccess('Success remove from watchlist'),
            ],
        verify: (bloc) {
          verify(mockRemoveGomuMovieWatchlistCase
              .removeWatchlisAction(testMovieDetail));

          return GomuMovieRemoveEvent(testMovieDetail).props;
        });

    blocTest<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        'should emit [Loading, Error] when data is not Removed',
        build: () {
          when(mockRemoveGomuMovieWatchlistCase
                  .removeWatchlisAction(testMovieDetail))
              .thenAnswer((_) async =>
                  const Left(DatabaseFailure('Remove Data Failed')));

          return gomuMovieWatchlistBloc;
        },
        act: (bloc) => bloc.add(GomuMovieRemoveEvent(testMovieDetail)),
        expect: () => [
              GomuMovieWatchlistError('Remove Data Failed'),
            ],
        verify: (bloc) {
          verify(mockRemoveGomuMovieWatchlistCase
              .removeWatchlisAction(testMovieDetail));

          return GomuMovieRemoveEvent(testMovieDetail).props;
        });
  });
}
