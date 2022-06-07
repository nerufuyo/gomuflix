import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';
import 'package:gomutv/domain/usecase/search_gomu_tv_case.dart';
import 'package:mockito/mockito.dart';

import '../handler/handler_test.mocks.dart';

void main() {
  late SearchGomuflixTvCase tvSearchUsecase;

  late MockGomuflixTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockGomuflixTvRepository();

    tvSearchUsecase = SearchGomuflixTvCase(mockTvRepository);
  });

  final testTv = <GomuflixTvEntity>[];
  final testQuery = 'Spiderman';

  test('should get list of tv from the repository', () async {
    // arrange
    when(mockTvRepository.searchGomuflixTvAct(testQuery))
        .thenAnswer((_) async => Right(testTv));
    // act
    final result = await tvSearchUsecase.execute(testQuery);
    // assert
    expect(result, Right(testTv));
  });
}
