import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gomu_movie_list_bloc_test.mocks.dart';

@GenerateMocks([GetGomuflixMovieListCase])
void main() {
  late GomuMovieNowPlayingBloc gomuMovieNowPlayingBloc;

  late GomuMoviePopularBloc gomuMoviePopularBloc;

  late GomuMovieTopRatedBloc gomuMovieTopRatedBloc;

  late MockGetGomuflixMovieListCase mockGetGomuflixMovieListCase;

  setUp(() {
    mockGetGomuflixMovieListCase = MockGetGomuflixMovieListCase();

    gomuMovieNowPlayingBloc =
        GomuMovieNowPlayingBloc(mockGetGomuflixMovieListCase);

    gomuMoviePopularBloc = GomuMoviePopularBloc(mockGetGomuflixMovieListCase);

    gomuMovieTopRatedBloc = GomuMovieTopRatedBloc(mockGetGomuflixMovieListCase);
  });

  final tMovie = GomuflixMovieEntity(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final tMovieList = <GomuflixMovieEntity>[tMovie];

// Now Playing
  group('Now Playing Movie', () {
    // Initial Test
    test('Initial state should be empty', () {
      expect(gomuMovieNowPlayingBloc.state, GomuMovieListInitial());
    });

    // Now Playing Movie Test
    blocTest<GomuMovieNowPlayingBloc, GomuMovieListState>(
      'Should emit [GomuMovie Loading, GomuMovie Loaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixMovieListCase.nowPlayingAction())
            .thenAnswer((_) async => Right(tMovieList));

        return gomuMovieNowPlayingBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [GomuMovieListLoading(), GomuMovieListLoaded(tMovieList)],
      verify: (bloc) {
        verify(mockGetGomuflixMovieListCase.nowPlayingAction());
      },
    );

    blocTest<GomuMovieNowPlayingBloc, GomuMovieListState>(
      'Should emit [GomuMovie Loading, GomuMovie Loaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixMovieListCase.nowPlayingAction())
            .thenAnswer((_) async => Right(<GomuflixMovieEntity>[]));

        return gomuMovieNowPlayingBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [
        GomuMovieListLoading(),
        GomuMovieListLoaded(<GomuflixMovieEntity>[])
      ],
      verify: (bloc) {
        verify(mockGetGomuflixMovieListCase.nowPlayingAction());
      },
    );

    blocTest<GomuMovieNowPlayingBloc, GomuMovieListState>(
      'Should emit [GomuMovie Loading, GomuMovie ListError] when get Failure',
      build: () {
        when(mockGetGomuflixMovieListCase.nowPlayingAction())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));

        return gomuMovieNowPlayingBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [GomuMovieListLoading(), GomuMovieListError('Failed')],
      verify: (_) {
        verify(mockGetGomuflixMovieListCase.nowPlayingAction());
      },
    );
  });

// Popular Movie
  group('Popular Movie', () {
    // Initial Test
    test('Initial state should be empty', () {
      expect(gomuMoviePopularBloc.state, GomuMovieListInitial());
    });

    // Popular Tv Test
    blocTest<GomuMoviePopularBloc, GomuMovieListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixMovieListCase.popularAction())
            .thenAnswer((_) async => Right(tMovieList));

        return gomuMoviePopularBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [GomuMovieListLoading(), GomuMovieListLoaded(tMovieList)],
      verify: (bloc) {
        verify(mockGetGomuflixMovieListCase.popularAction());
      },
    );

    blocTest<GomuMoviePopularBloc, GomuMovieListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixMovieListCase.popularAction())
            .thenAnswer((_) async => Right(<GomuflixMovieEntity>[]));

        return gomuMoviePopularBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [
        GomuMovieListLoading(),
        GomuMovieListLoaded(<GomuflixMovieEntity>[])
      ],
      verify: (bloc) {
        verify(mockGetGomuflixMovieListCase.popularAction());
      },
    );

    blocTest<GomuMoviePopularBloc, GomuMovieListState>(
      'Should emit [GomuTvListLoading, GomuTvListError] when get Failure',
      build: () {
        when(mockGetGomuflixMovieListCase.popularAction())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));

        return gomuMoviePopularBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [GomuMovieListLoading(), GomuMovieListError('Failed')],
      verify: (_) {
        verify(mockGetGomuflixMovieListCase.popularAction());
      },
    );
  });

  // Top Rated
  group('Top Rated Tv', () {
    // Initial Test
    test('Initial state should be empty', () {
      expect(gomuMovieTopRatedBloc.state, GomuMovieListInitial());
    });

    // Top Rated Tv Test
    blocTest<GomuMovieTopRatedBloc, GomuMovieListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixMovieListCase.topRatedAction())
            .thenAnswer((_) async => Right(tMovieList));

        return gomuMovieTopRatedBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [GomuMovieListLoading(), GomuMovieListLoaded(tMovieList)],
      verify: (bloc) {
        verify(mockGetGomuflixMovieListCase.topRatedAction());
      },
    );

    blocTest<GomuMovieTopRatedBloc, GomuMovieListState>(
      'Should emit [GomuTvListLoading, GomuTvListLoaded] when data is gotten successfully',
      build: () {
        when(mockGetGomuflixMovieListCase.topRatedAction())
            .thenAnswer((_) async => Right(<GomuflixMovieEntity>[]));

        return gomuMovieTopRatedBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [
        GomuMovieListLoading(),
        GomuMovieListLoaded(<GomuflixMovieEntity>[])
      ],
      verify: (bloc) {
        verify(mockGetGomuflixMovieListCase.topRatedAction());
      },
    );

    blocTest<GomuMovieTopRatedBloc, GomuMovieListState>(
      'Should emit [GomuTvListLoading, GomuTvListError] when get Failure',
      build: () {
        when(mockGetGomuflixMovieListCase.topRatedAction())
            .thenAnswer((_) async => Left(ServerFailure('Failed')));

        return gomuMovieTopRatedBloc;
      },
      act: (bloc) => bloc.add(GomuMovieListEvent()),
      expect: () => [GomuMovieListLoading(), GomuMovieListError('Failed')],
      verify: (_) {
        verify(mockGetGomuflixMovieListCase.topRatedAction());
      },
    );
  });
}
