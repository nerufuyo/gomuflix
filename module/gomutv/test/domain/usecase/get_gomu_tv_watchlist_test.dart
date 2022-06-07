import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../handler/handler_test.mocks.dart';

void main() {
  late GetGomuflixTvWatchlistCase tvWatchlistUsecase;

  late RemoveGomuflixTvWatchlistCase tvRemoveWatchlistUsecase;

  late SaveGomuflixTvWatchlistCase tvSaveWatchlistUsecase;

  late MockGomuflixTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockGomuflixTvRepository();

    tvWatchlistUsecase = GetGomuflixTvWatchlistCase(mockTvRepository);

    tvRemoveWatchlistUsecase = RemoveGomuflixTvWatchlistCase(mockTvRepository);

    tvSaveWatchlistUsecase = SaveGomuflixTvWatchlistCase(mockTvRepository);
  });

  // Tv Watchlist
  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.getGomuflixTvWatchlistAct())
        .thenAnswer((_) async => Right(testTvSeriesList));

    // act
    final result = await tvWatchlistUsecase.watchlistAction();

    // assert
    expect(result, Right(testTvSeriesList));
  });

  // Remove Watchlist
  test('should remove watchlist tv from repository', () async {
    // arrange
    when(mockTvRepository.removeGomuflixTvAct(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));

    // act
    final result = await tvRemoveWatchlistUsecase
        .removeWatchlistAction(testTvSeriesDetail);

    // assert
    verify(mockTvRepository.removeGomuflixTvAct(testTvSeriesDetail));

    expect(result, Right('Removed from watchlist'));
  });

  // Save Watchlist
  test('should save tv to the repository', () async {
    // arrange
    when(mockTvRepository.saveGomuflixTvAct(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));

    // act
    final result =
        await tvSaveWatchlistUsecase.saveWatchlistAction(testTvSeriesDetail);

    // assert
    verify(mockTvRepository.saveGomuflixTvAct(testTvSeriesDetail));

    expect(result, Right('Added to Watchlist'));
  });
}
