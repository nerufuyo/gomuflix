import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../handler/handler_test.mocks.dart';

void main() {
  late GetGomuflixMovieWatchlistCase movieWatchlistUsecase;

  late RemoveGomuflixMoviewatchlist movieRemoveWatchlistUsecase;

  late SaveGomuflixMoviewatchlist movieSaveWatchlistUsecase;

  late MockGomuflixMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockGomuflixMovieRepository();

    movieWatchlistUsecase = GetGomuflixMovieWatchlistCase(mockMovieRepository);

    movieRemoveWatchlistUsecase =
        RemoveGomuflixMoviewatchlist(mockMovieRepository);

    movieSaveWatchlistUsecase = SaveGomuflixMoviewatchlist(mockMovieRepository);
  });

  // Movie Watchlist
  test('should get watchlist list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getGomuflixMovieWatchlistAct())
        .thenAnswer((_) async => Right(testMovieList));
    // act
    final result = await movieWatchlistUsecase.watchlistAction();
    // assert
    expect(result, Right(testMovieList));
  });

  // Movie Watchlist Status
  test('should get watchlist status from repository', () async {
    // arrange
    when(mockMovieRepository.isAddedToWatchlist(1))
        .thenAnswer((_) async => true);
    // act
    final result = await movieWatchlistUsecase.execute(1);
    // assert
    expect(result, true);
  });

  // Movie Remove Watchlist
  test('should remove watchlist movie from repository', () async {
    // arrange
    when(mockMovieRepository.removeGomuflixMovieWatchlistAct(testMovieDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result =
        await movieRemoveWatchlistUsecase.removeWatchlisAction(testMovieDetail);
    // assert
    verify(
        mockMovieRepository.removeGomuflixMovieWatchlistAct(testMovieDetail));
    expect(result, Right('Removed from watchlist'));
  });

  // Movie Save Watchlist
  test('should save movie to the repository', () async {
    // arrange
    when(mockMovieRepository.saveGomuflixMovieWatchlistAct(testMovieDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result =
        await movieSaveWatchlistUsecase.saveWatchlisAction(testMovieDetail);
    // assert
    verify(mockMovieRepository.saveGomuflixMovieWatchlistAct(testMovieDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
