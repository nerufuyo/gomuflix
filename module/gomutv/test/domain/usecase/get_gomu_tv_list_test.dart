import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';
import 'package:gomutv/domain/usecase/get_gomu_tv_list_case.dart';
import 'package:mockito/mockito.dart';

import '../handler/handler_test.mocks.dart';

void main() {
  late GetGomuflixTvListCase tvListUsecase;

  late MockGomuflixTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockGomuflixTvRepository();

    tvListUsecase = GetGomuflixTvListCase(mockTvRepository);
  });

  final testTv = <GomuflixTvEntity>[];

  // Tv On Air
  test('should get list of movies from the repository', () async {
    // arrange
    when(mockTvRepository.getGomuflixTvOnAirAct())
        .thenAnswer((_) async => Right(testTv));

    // act
    final result = await tvListUsecase.onAirAction();

    // assert
    expect(result, Right(testTv));
  });

  // Tv Popular
  test(
      'should get list of movies from the repository when execute function is called',
      () async {
    // arrange
    when(mockTvRepository.getGomuflixTvPopularAct())
        .thenAnswer((_) async => Right(testTv));

    // act
    final result = await tvListUsecase.popularAction();

    // assert
    expect(result, Right(testTv));
  });

  // Tv Top Rated
  test('should get list of movies from repository', () async {
    // arrange
    when(mockTvRepository.getGomuflixTvTopRatedAct())
        .thenAnswer((_) async => Right(testTv));

    // act
    final result = await tvListUsecase.topRatedAction();

    // assert
    expect(result, Right(testTv));
  });
}
