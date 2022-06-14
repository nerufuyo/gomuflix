import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart';
import 'package:gomumovie/domain/usecases/get_gomu_movie_list_case.dart';
import 'package:mockito/mockito.dart';

import '../handler/handler_test.mocks.dart';

void main() {
  late GetGomuflixMovieListCase movieListUsecase;

  late MockGomuflixMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockGomuflixMovieRepository();

    movieListUsecase = GetGomuflixMovieListCase(mockMovieRepository);
  });

  final testMovies = <GomuflixMovieEntity>[];

  // Movie Now Playing
  test('should get now playing movie list of movies from the repository',
      () async {
    // arrange
    when(mockMovieRepository.getGomuflixMovieNowPlayingAct())
        .thenAnswer((_) async => Right(testMovies));

    // act
    final result = await movieListUsecase.nowPlayingAction();

    // assert
    expect(result, Right(testMovies));
  });

  // Movie Popular
  test('should get popular movie list of movies from the repository ',
      () async {
    // arrange
    when(mockMovieRepository.getGomuflixMoviePopularAct())
        .thenAnswer((_) async => Right(testMovies));

    // act
    final result = await movieListUsecase.popularAction();

    // assert
    expect(result, Right(testMovies));
  });

  // Movie Top Rated
  test('should get top rated movies list of movies from repository', () async {
    // arrange
    when(mockMovieRepository.getGomuflixMovieTopRatedAct())
        .thenAnswer((_) async => Right(testMovies));

    // act
    final result = await movieListUsecase.topRatedAction();

    // assert
    expect(result, Right(testMovies));
  });
}
