import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';
import 'package:gomutv/domain/usecase/get_gomu_tv_detail_case.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../handler/handler_test.mocks.dart';

void main() {
  late GetGomuflixTvDetailCase tvDetailUsecase;

  late MockGomuflixTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockGomuflixTvRepository();

    tvDetailUsecase = GetGomuflixTvDetailCase(mockTvRepository);
  });

  final tId = 1;

  final testTv = <GomuflixTvEntity>[];

  test('should get tv detail from the repository', () async {
    // arrange
    when(mockTvRepository.getGomuflixTvDetailAct(tId))
        .thenAnswer((_) async => Right(testTvSeriesDetail));
    // act
    final result = await tvDetailUsecase.detailAction(tId);
    // assert
    expect(result, Right(testTvSeriesDetail));
  });

  test('should get list of tv recommendations from the repository', () async {
    // arrange
    when(mockTvRepository.getGomuflixTvRecommendationAct(tId))
        .thenAnswer((_) async => Right(testTv));
    // act
    final result = await tvDetailUsecase.recommendationAction(tId);
    // assert
    expect(result, Right(testTv));
  });
}
