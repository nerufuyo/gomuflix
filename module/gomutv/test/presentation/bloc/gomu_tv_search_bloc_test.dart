import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gomu_tv_search_bloc_test.mocks.dart';

@GenerateMocks([SearchGomuflixTvCase])
void main() {
  late GomuTvSearchBloc gomuTvSearchBloc;

  late MockSearchGomuflixTvCase mockSearchGomuflixTvCase;

  setUp(() {
    mockSearchGomuflixTvCase = MockSearchGomuflixTvCase();

    gomuTvSearchBloc = GomuTvSearchBloc(mockSearchGomuflixTvCase);
  });

  final tTv = GomuflixTvEntity(
      backdropPath: "/xAKMj134XHQVNHLC6rWsccLMenG.jpg",
      firstAirDate: "2021-10-12",
      genreIds: [10765, 35, 80],
      id: 90462,
      name: "Chucky",
      originalName: "Chucky",
      overview:
          "After a vintage Chucky doll turns up at a suburban yard sale, an idyllic American town is thrown into chaos as a series of horrifying murders begin to expose the town’s hypocrisies and secrets. Meanwhile, the arrival of enemies — and allies — from Chucky’s past threatens to expose the truth behind the killings, as well as the demon doll’s untold origins.",
      popularity: 6008.272,
      posterPath: "/iF8ai2QLNiHV4anwY1TuSGZXqfN.jpg",
      voteAverage: 8,
      voteCount: 987);

  final tTvList = <GomuflixTvEntity>[tTv];

  final tQueryTv = 'chucky';

  group('Search Tv', () {
    test('Initial state should be empty', () {
      expect(gomuTvSearchBloc.state, GomuTvSearchInitial(''));
    });

    blocTest<GomuTvSearchBloc, GomuTvSearchState>(
      'Should emit [SearchLoading, SearchHasData] when data is gotten successfully',
      build: () {
        when(mockSearchGomuflixTvCase.execute(tQueryTv))
            .thenAnswer((_) async => Right(tTvList));

        return gomuTvSearchBloc;
      },
      act: (bloc) => bloc.add(GomuTvSearchEventSearch(tQueryTv)),
      wait: const Duration(milliseconds: 500),
      expect: () => [GomuTvSearchLoading(), GomuTvSearchLoaded(tTvList)],
      verify: (bloc) {
        verify(mockSearchGomuflixTvCase.execute(tQueryTv));
      },
    );

    blocTest<GomuTvSearchBloc, GomuTvSearchState>(
      'Should emit [SearchLoading, SearchHasData[], SearchEmpty] when data is empty',
      build: () {
        when(mockSearchGomuflixTvCase.execute(tQueryTv))
            .thenAnswer((_) async => Right(<GomuflixTvEntity>[]));

        return gomuTvSearchBloc;
      },
      act: (bloc) => bloc.add(GomuTvSearchEventSearch(tQueryTv)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        GomuTvSearchLoading(),
        GomuTvSearchLoaded(<GomuflixTvEntity>[]),
        GomuTvSearchEmpty('No Result')
      ],
      verify: (bloc) {
        verify(mockSearchGomuflixTvCase.execute(tQueryTv));
      },
    );

    blocTest<GomuTvSearchBloc, GomuTvSearchState>(
      'Should emit [SearchLoading, SearchError] when data is unsuccessful',
      build: () {
        when(mockSearchGomuflixTvCase.execute(tQueryTv))
            .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

        return gomuTvSearchBloc;
      },
      act: (bloc) => bloc.add(GomuTvSearchEventSearch(tQueryTv)),
      wait: const Duration(milliseconds: 500),
      expect: () =>
          [GomuTvSearchLoading(), GomuTvSearchError('Server Failure')],
      verify: (bloc) {
        verify(mockSearchGomuflixTvCase.execute(tQueryTv));
      },
    );
  });
}
