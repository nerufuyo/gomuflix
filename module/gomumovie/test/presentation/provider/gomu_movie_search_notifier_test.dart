import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gomu_movie_search_notifier_test.mocks.dart';

@GenerateMocks([SearchGomuflixMovie])
void main() {
  late GomuflixMovieSearchNotifier movieProvider;

  late MockSearchGomuflixMovie mockSearchMovie;

  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;

    mockSearchMovie = MockSearchGomuflixMovie();

    movieProvider = GomuflixMovieSearchNotifier(searchMovie: mockSearchMovie)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tMovieModel = GomuflixMovieEntity(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final testMovieList = <GomuflixMovieEntity>[tMovieModel];
  final testQuery = 'spiderman';

  group('search movies', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchMovie.execute(testQuery))
          .thenAnswer((_) async => Right(testMovieList));

      // act
      movieProvider.syncSearchMovie(testQuery);

      // assert
      expect(movieProvider.state, RequestState.loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchMovie.execute(testQuery))
          .thenAnswer((_) async => Right(testMovieList));

      // act
      await movieProvider.syncSearchMovie(testQuery);

      // assert
      expect(movieProvider.state, RequestState.loaded);

      expect(movieProvider.searchResult, testMovieList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchMovie.execute(testQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await movieProvider.syncSearchMovie(testQuery);

      // assert
      expect(movieProvider.state, RequestState.error);

      expect(movieProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });
}
