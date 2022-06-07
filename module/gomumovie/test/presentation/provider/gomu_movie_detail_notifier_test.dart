import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_movie_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetGomuflixMovieDetailCase,
  GetGomuflixMovieWatchlistCase,
  SaveGomuflixMoviewatchlist,
  RemoveGomuflixMoviewatchlist
])
void main() {
  late GomuflixMovieDetailNotifier movieProvider;

  late MockGetGomuflixMovieDetailCase mockMovieDetail;

  late MockGetGomuflixMovieWatchlistCase mockMovieWatchlistStatus;

  late MockSaveGomuflixMoviewatchlist mockSaveMovie;

  late MockRemoveGomuflixMoviewatchlist mockRemoveMovie;

  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;

    mockMovieDetail = MockGetGomuflixMovieDetailCase();

    mockMovieWatchlistStatus = MockGetGomuflixMovieWatchlistCase();

    mockSaveMovie = MockSaveGomuflixMoviewatchlist();

    mockRemoveMovie = MockRemoveGomuflixMoviewatchlist();

    movieProvider = GomuflixMovieDetailNotifier(
      getGomuMovieDetail: mockMovieDetail,
      getGomuMovieRecommendation: mockMovieDetail,
      getGomuMovieWatchlistStatus: mockMovieWatchlistStatus,
      removeGomuMovieWatchlist: mockRemoveMovie,
      saveGomuMovieWatchlist: mockSaveMovie,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

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
  final tMovies = <GomuflixMovieEntity>[tMovie];

  void _arrangeUsecase() {
    when(mockMovieDetail.detailAction(tId))
        .thenAnswer((_) async => Right(testMovieDetail));
    when(mockMovieDetail.recommendationAction(tId))
        .thenAnswer((_) async => Right(tMovies));
  }

  // Movie Detail
  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();

      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      verify(mockMovieDetail.detailAction(tId));

      verify(mockMovieDetail.recommendationAction(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();

      // act
      movieProvider.syncGomuMovieDetail(tId);

      // assert
      expect(movieProvider.movieState, RequestState.loading);

      expect(listenerCallCount, 1);
    });

    test('should change movie when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      expect(movieProvider.movieState, RequestState.loaded);

      expect(movieProvider.movie, testMovieDetail);

      expect(listenerCallCount, 3);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();

      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      expect(movieProvider.movieState, RequestState.loaded);

      expect(movieProvider.movieRecommendations, tMovies);
    });
  });

  // Movie Recommendation
  group('Get Movie Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();

      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      verify(mockMovieDetail.recommendationAction(tId));

      expect(movieProvider.movieRecommendations, tMovies);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();

      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      expect(movieProvider.recommendationState, RequestState.loaded);

      expect(movieProvider.movieRecommendations, tMovies);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockMovieDetail.detailAction(tId))
          .thenAnswer((_) async => Right(testMovieDetail));

      when(mockMovieDetail.recommendationAction(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));

      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      expect(movieProvider.recommendationState, RequestState.loaded);

      expect(movieProvider.message, 'Failed');
    });
  });

  // Watchlist
  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockMovieWatchlistStatus.execute(1)).thenAnswer((_) async => true);

      // act
      await movieProvider.loadWatchlistStatus(1);

      // assert
      expect(movieProvider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveMovie.saveWatchlisAction(testMovieDetail))
          .thenAnswer((_) async => Right('Success'));

      when(mockMovieWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);

      // act
      await movieProvider.syncGomuMovieAddWatchlist(testMovieDetail);

      // assert
      verify(mockSaveMovie.saveWatchlisAction(testMovieDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveMovie.removeWatchlisAction(testMovieDetail))
          .thenAnswer((_) async => Right('Removed'));

      when(mockMovieWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);

      // act
      await movieProvider.syncGomuMovieRemoveWatchlist(testMovieDetail);

      // assert
      verify(mockRemoveMovie.removeWatchlisAction(testMovieDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveMovie.saveWatchlisAction(testMovieDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));

      when(mockMovieWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);

      // act
      await movieProvider.syncGomuMovieAddWatchlist(testMovieDetail);

      // assert
      verify(mockMovieWatchlistStatus.execute(testMovieDetail.id));

      expect(movieProvider.isAddedToWatchlist, true);

      expect(movieProvider.watchlistMessage, 'Added to Watchlist');

      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveMovie.saveWatchlisAction(testMovieDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));

      when(mockMovieWatchlistStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);

      // act
      await movieProvider.syncGomuMovieAddWatchlist(testMovieDetail);

      // assert
      expect(movieProvider.watchlistMessage, 'Failed');

      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockMovieDetail.detailAction(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      when(mockMovieDetail.recommendationAction(tId))
          .thenAnswer((_) async => Right(tMovies));

      // act
      await movieProvider.syncGomuMovieDetail(tId);

      // assert
      expect(movieProvider.movieState, RequestState.error);

      expect(movieProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });
}
