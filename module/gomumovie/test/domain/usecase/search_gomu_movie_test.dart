import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart';
import 'package:gomumovie/domain/usecases/search_gomu_movie_case.dart';
import 'package:mockito/mockito.dart';

import '../handler/handler_test.mocks.dart';

void main() {
  late SearchGomuflixMovie movieSearchUsecase;

  late MockGomuflixMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockGomuflixMovieRepository();

    movieSearchUsecase = SearchGomuflixMovie(mockMovieRepository);
  });

  final testMovie = <GomuflixMovieEntity>[];

  final testQuery = 'Spiderman';

  // Movie Search
  test('should get list of movies from the repository', () async {
    // arrange
    when(mockMovieRepository.searchGomuflixMovieAct(testQuery))
        .thenAnswer((_) async => Right(testMovie));

    // act
    final result = await movieSearchUsecase.execute(testQuery);

    // assert
    expect(result, Right(testMovie));
  });
}
