import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gomu_movie_search_bloc_test.mocks.dart';

@GenerateMocks([SearchGomuflixMovie])
void main() {
  late GomuMovieSearchBloc gomuMovieSearchBloc;

  late MockSearchGomuflixMovie mockSearchGomuflixMovie;

  setUp(() {
    mockSearchGomuflixMovie = MockSearchGomuflixMovie();

    gomuMovieSearchBloc = GomuMovieSearchBloc(mockSearchGomuflixMovie);
  });

  final tMovie = GomuflixMovieEntity(
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
  final tMovieList = <GomuflixMovieEntity>[tMovie];

  final tQuery = 'spiderman';

  group('Search Movies', () {
    test('Initial state should be empty', () {
      expect(gomuMovieSearchBloc.state, GomuMovieSearchInitial(''));
    });

    blocTest<GomuMovieSearchBloc, GomuMovieSearchState>(
      'Should emit [SearchLoading, SearchHasData] when data is gotten successfully',
      build: () {
        when(mockSearchGomuflixMovie.execute(tQuery))
            .thenAnswer((_) async => Right(tMovieList));

        return gomuMovieSearchBloc;
      },
      act: (bloc) => bloc.add(GomuMovieSearchEventSearch(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () =>
          [GomuMovieSearchLoading(), GomuMovieSearchLoaded(tMovieList)],
      verify: (bloc) {
        verify(mockSearchGomuflixMovie.execute(tQuery));
      },
    );

    blocTest<GomuMovieSearchBloc, GomuMovieSearchState>(
      'Should emit [SearchLoading, SearchHasData[], SearchEmpty] when data is empty',
      build: () {
        when(mockSearchGomuflixMovie.execute(tQuery))
            .thenAnswer((_) async => Right(<GomuflixMovieEntity>[]));

        return gomuMovieSearchBloc;
      },
      act: (bloc) => bloc.add(GomuMovieSearchEventSearch(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        GomuMovieSearchLoading(),
        GomuMovieSearchLoaded(<GomuflixMovieEntity>[]),
        GomuMovieSearchEmpty('No Result'),
      ],
      verify: (bloc) {
        verify(mockSearchGomuflixMovie.execute(tQuery));
      },
    );

    blocTest<GomuMovieSearchBloc, GomuMovieSearchState>(
      'Should emit [SearchLoading, SearchError] when data is unsuccessful',
      build: () {
        when(mockSearchGomuflixMovie.execute(tQuery))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

        return gomuMovieSearchBloc;
      },
      act: (bloc) => bloc.add(GomuMovieSearchEventSearch(tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        GomuMovieSearchLoading(),
        GomuMovieSearchError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchGomuflixMovie.execute(tQuery));
      },
    );
  });
}
