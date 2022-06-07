import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../handler/handler_test.mocks.dart';

void main() {
  late GetGomuflixMovieDetailCase movieDetailUsecase;

  late MockGomuflixMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockGomuflixMovieRepository();

    movieDetailUsecase = GetGomuflixMovieDetailCase(mockMovieRepository);
  });

  final tId = 1;

  final testMovies = <GomuflixMovieEntity>[];

  // Movie Detail
  test('should get movie detail from the repository', () async {
    // arrange
    when(mockMovieRepository.getGomuflixMovieDetailAct(tId))
        .thenAnswer((_) async => Right(testMovieDetail));

    // act
    final result = await movieDetailUsecase.detailAction(tId);

    // assert
    expect(result, Right(testMovieDetail));
  });

  // Movie Recommendation
  test('should get list of movie recommendations from the repository',
      () async {
    // arrange
    when(mockMovieRepository.getGomuflixMovieRecommendationAct(tId))
        .thenAnswer((_) async => Right(testMovies));

    // act
    final result = await movieDetailUsecase.recommendationAction(tId);

    // assert
    expect(result, Right(testMovies));
  });
}
