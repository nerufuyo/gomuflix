import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gomu_tv_list_bloc_test.mocks.dart';

@GenerateMocks([GetGomuflixTvListCase])
void main() {
  // Declarate Variable
  late GomuTvOnAirBloc gomuTvOnAirBloc;

  late GomuTvPopularBloc gomuTvPopularBloc;

  late GomuTvTopRatedBloc gomuTvTopRatedBloc;

  late MockGetGomuflixTvListCase mockGetGomuflixTvListCase;

  setUp(() {
    mockGetGomuflixTvListCase = MockGetGomuflixTvListCase();

    gomuTvOnAirBloc = GomuTvOnAirBloc(mockGetGomuflixTvListCase);

    gomuTvPopularBloc = GomuTvPopularBloc(mockGetGomuflixTvListCase);

    gomuTvTopRatedBloc = GomuTvTopRatedBloc(mockGetGomuflixTvListCase);
  });

  final tTvShow = GomuflixTvEntity(
      backdropPath: "/xAKMj134XHQVNHLC6rWsccLMenG.jpg",
      firstAirDate: "2021-10-12",
      genreIds: [10765, 35, 80],
      id: 90462,
      name: "Chucky",
      originalName: "Chucky",
      overview:
          "After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.",
      popularity: 6008.272,
      posterPath: "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
      voteAverage: 8,
      voteCount: 987);

  final tTvShowList = <GomuflixTvEntity>[tTvShow];

  group('On air tv', () {
    // Initial Test
    test('Initial state should be empty', () {
      expect(gomuTvOnAirBloc.state, GomuTvListInitial());
    });

    // On Air Tv Test
    blocTest<GomuTvOnAirBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixTvListCase.onAirAction())
            .thenAnswer((_) async => Right(tTvShowList));

        return gomuTvOnAirBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () => [GomuTvListLoading(), GomuTvListLoaded(tTvShowList)],
      verify: (bloc) {
        verify(mockGetGomuflixTvListCase.onAirAction());
      },
    );

    blocTest<GomuTvOnAirBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixTvListCase.onAirAction())
            .thenAnswer((_) async => Right(<GomuflixTvEntity>[]));

        return gomuTvOnAirBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () =>
          [GomuTvListLoading(), GomuTvListLoaded(<GomuflixTvEntity>[])],
      verify: (bloc) {
        verify(mockGetGomuflixTvListCase.onAirAction());
      },
    );

    blocTest<GomuTvOnAirBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListError] when get Failure',
      build: () {
        when(mockGetGomuflixTvListCase.onAirAction())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));

        return gomuTvOnAirBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () => [GomuTvListLoading(), GomuTvListError('Failed')],
      verify: (_) {
        verify(mockGetGomuflixTvListCase.onAirAction());
      },
    );
  });

  group('Popular Tv', () {
    // Initial Test
    test('Initial state should be empty', () {
      expect(gomuTvPopularBloc.state, GomuTvListInitial());
    });

    // Popular Tv Test
    blocTest<GomuTvPopularBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixTvListCase.popularAction())
            .thenAnswer((_) async => Right(tTvShowList));

        return gomuTvPopularBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () => [GomuTvListLoading(), GomuTvListLoaded(tTvShowList)],
      verify: (bloc) {
        verify(mockGetGomuflixTvListCase.popularAction());
      },
    );

    blocTest<GomuTvPopularBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixTvListCase.popularAction())
            .thenAnswer((_) async => Right(<GomuflixTvEntity>[]));

        return gomuTvPopularBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () =>
          [GomuTvListLoading(), GomuTvListLoaded(<GomuflixTvEntity>[])],
      verify: (bloc) {
        verify(mockGetGomuflixTvListCase.popularAction());
      },
    );

    blocTest<GomuTvPopularBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListError] when get Failure',
      build: () {
        when(mockGetGomuflixTvListCase.popularAction())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));

        return gomuTvPopularBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () => [GomuTvListLoading(), GomuTvListError('Failed')],
      verify: (_) {
        verify(mockGetGomuflixTvListCase.popularAction());
      },
    );
  });

  // Top Rated
  group('Top Rated Tv', () {
    // Initial Test
    test('Initial state should be empty', () {
      expect(gomuTvTopRatedBloc.state, GomuTvListInitial());
    });

    // Top Rated Tv Test
    blocTest<GomuTvTopRatedBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixTvListCase.topRatedAction())
            .thenAnswer((_) async => Right(tTvShowList));

        return gomuTvTopRatedBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () => [GomuTvListLoading(), GomuTvListLoaded(tTvShowList)],
      verify: (bloc) {
        verify(mockGetGomuflixTvListCase.topRatedAction());
      },
    );

    blocTest<GomuTvTopRatedBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixTvListCase.topRatedAction())
            .thenAnswer((_) async => Right(<GomuflixTvEntity>[]));

        return gomuTvTopRatedBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () =>
          [GomuTvListLoading(), GomuTvListLoaded(<GomuflixTvEntity>[])],
      verify: (bloc) {
        verify(mockGetGomuflixTvListCase.topRatedAction());
      },
    );

    blocTest<GomuTvTopRatedBloc, GomuTvListState>(
      'Should emit [GomuTvListLoading, GomuTvListError] when get Failure',
      build: () {
        when(mockGetGomuflixTvListCase.topRatedAction())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));

        return gomuTvTopRatedBloc;
      },
      act: (bloc) => bloc.add(GomuTvListEvent()),
      expect: () => [GomuTvListLoading(), GomuTvListError('Failed')],
      verify: (_) {
        verify(mockGetGomuflixTvListCase.topRatedAction());
      },
    );
  });
}
