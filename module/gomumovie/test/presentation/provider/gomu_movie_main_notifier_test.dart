import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_movie_main_notifier_test.mocks.dart';

@GenerateMocks([GetGomuflixMovieListCase, GetGomuflixMovieWatchlistCase])
void main() {
  late GomuflixMovieListNotifier movieListProvider;

  late MockGetGomuflixMovieListCase mockGetMovieList;

  late MockGetGomuflixMovieWatchlistCase mockGetMovieWatchlist;

  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;

    mockGetMovieList = MockGetGomuflixMovieListCase();

    mockGetMovieWatchlist = MockGetGomuflixMovieWatchlistCase();

    movieListProvider = GomuflixMovieListNotifier(
      getNowPlayingMovies: mockGetMovieList,
      getPopularMovies: mockGetMovieList,
      getTopRatedMovies: mockGetMovieList,
      getWatchlistMovies: mockGetMovieWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
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
  group('now playing movies', () {
    test('initialState should be Empty', () {
      expect(movieListProvider.gomuMovieNowPlayingState,
          equals(RequestState.empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(mockGetMovieList.nowPlayingAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      movieListProvider.syncGomuMovieNowPlaying();

      // assert
      verify(mockGetMovieList.nowPlayingAction());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(mockGetMovieList.nowPlayingAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      movieListProvider.syncGomuMovieNowPlaying();

      // assert
      expect(movieListProvider.gomuMovieNowPlayingState, RequestState.loading);
    });

    test('should change movies when data is gotten successfully', () async {
      // arrange
      when(mockGetMovieList.nowPlayingAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      await movieListProvider.syncGomuMovieNowPlaying();

      // assert
      expect(movieListProvider.gomuMovieNowPlayingState, RequestState.loaded);

      expect(movieListProvider.nowPlayingMovies, tMovieList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieList.nowPlayingAction())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await movieListProvider.syncGomuMovieNowPlaying();

      // assert
      expect(movieListProvider.gomuMovieNowPlayingState, RequestState.error);

      expect(movieListProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });

  // Popular Movie
  group('popular movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetMovieList.popularAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      movieListProvider.syncGomuMoviePopular();

      // assert
      expect(movieListProvider.gomuMoviePopularState, RequestState.loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetMovieList.popularAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      await movieListProvider.syncGomuMoviePopular();

      // assert
      expect(movieListProvider.gomuMoviePopularState, RequestState.loaded);

      expect(movieListProvider.popularMovies, tMovieList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieList.popularAction())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await movieListProvider.syncGomuMoviePopular();

      // assert
      expect(movieListProvider.gomuMoviePopularState, RequestState.error);

      expect(movieListProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });

  // Top Rated
  group('top rated movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetMovieList.topRatedAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      movieListProvider.syncGomuMovieTopRated();

      // assert
      expect(movieListProvider.gomuMovieTopRatedState, RequestState.loading);
    });

    test('should change movies data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetMovieList.topRatedAction())
          .thenAnswer((_) async => Right(tMovieList));

      // act
      await movieListProvider.syncGomuMovieTopRated();

      // assert
      expect(movieListProvider.gomuMovieTopRatedState, RequestState.loaded);

      expect(movieListProvider.topRatedMovies, tMovieList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieList.topRatedAction())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await movieListProvider.syncGomuMovieTopRated();

      // assert
      expect(movieListProvider.gomuMovieTopRatedState, RequestState.error);

      expect(movieListProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });

  // Movie Watchlist
  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetMovieWatchlist.watchlistAction())
        .thenAnswer((_) async => Right([testWatchlistMovie]));

    // act
    await movieListProvider.syncGomuMovieWatchlist();

    // assert
    expect(movieListProvider.gomuMovieWatchlistState, RequestState.loaded);

    expect(movieListProvider.watchlistMovies, [testWatchlistMovie]);

    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetMovieWatchlist.watchlistAction())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));

    // act
    await movieListProvider.syncGomuMovieWatchlist();

    // assert
    expect(movieListProvider.gomuMovieWatchlistState, RequestState.error);

    expect(movieListProvider.message, "Can't get data");

    expect(listenerCallCount, 2);
  });
}
