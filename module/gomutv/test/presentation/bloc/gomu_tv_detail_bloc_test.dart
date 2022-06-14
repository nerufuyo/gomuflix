import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_tv_detail_bloc_test.mocks.dart';

@GenerateMocks([GetGomuflixTvDetailCase])
const id = 1;

void main() {
  // Declarate Variable
  late GomuTvDetailBloc tvDetailBloc;

  late GomuTvRecommendationBloc tvRecommendationBloc;

  late MockGetGomuflixTvDetailCase mockGetGomuflixTvDetailCase;

  const testTvId = 1;

  setUp(() {
    mockGetGomuflixTvDetailCase = MockGetGomuflixTvDetailCase();

    tvDetailBloc = GomuTvDetailBloc(mockGetGomuflixTvDetailCase);

    tvRecommendationBloc =
        GomuTvRecommendationBloc(mockGetGomuflixTvDetailCase);
  });

  group('Tv Detail', () {
    test('the initial state should be MoviesDetailsEmpty', () {
      expect(tvDetailBloc.state, GomuTvDetailInitial());
    });

    blocTest<GomuTvDetailBloc, GomuTvDetailState>(
        'should emit [Loading, Loaded] when GetDetailsTvsEvent is added',
        build: () {
      when(mockGetGomuflixTvDetailCase.detailAction(testTvId))
          .thenAnswer((_) async => Right(testTvSeriesDetail));

      return tvDetailBloc;
    }, act: (bloc) {
      bloc.add(GomuTvDetailEvent(testTvId));
    }, expect: () {
      return [
        GomuTvDetailLoading(),
        GomuTvDetailLoaded(testTvSeriesDetail),
      ];
    }, verify: (bloc) {
      verify(mockGetGomuflixTvDetailCase.detailAction(testTvId));

      return tvDetailBloc.state.props;
    });

    blocTest<GomuTvDetailBloc, GomuTvDetailState>(
        'should emit [Loading, Error] when GetDetailsMoviesEvent is added',
        build: () {
      when(mockGetGomuflixTvDetailCase.detailAction(testTvId)).thenAnswer(
          (_) async => const Left(ServerFailure('The Server is Failure')));

      return tvDetailBloc;
    }, act: (bloc) {
      bloc.add(GomuTvDetailEvent(testTvId));
    }, expect: () {
      return [
        GomuTvDetailLoading(),
        GomuTvDetailError('The Server is Failure')
      ];
    }, verify: (bloc) {
      verify(mockGetGomuflixTvDetailCase.detailAction(testTvId));

      return tvDetailBloc.state.props;
    });
  });

  group('Tv Recommendation', () {
    test('the initial state should be MoviesDetailsEmpty', () {
      expect(tvRecommendationBloc.state, GomuTvDetailInitial());
    });

    blocTest<GomuTvRecommendationBloc, GomuTvDetailState>(
        'should emit [Loading, Loaded] when GetDetailsTvsEvent is added',
        build: () {
      when(mockGetGomuflixTvDetailCase.recommendationAction(testTvId))
          .thenAnswer((_) async => Right(testTvSeriesList));

      return tvRecommendationBloc;
    }, act: (bloc) {
      bloc.add(GomuTvDetailEvent(testTvId));
    }, expect: () {
      return [
        GomuTvDetailLoading(),
        GomuTvRecommendationLoaded(testTvSeriesList)
      ];
    }, verify: (bloc) {
      verify(mockGetGomuflixTvDetailCase.recommendationAction(testTvId));

      return tvRecommendationBloc.state.props;
    });

    blocTest<GomuTvRecommendationBloc, GomuTvDetailState>(
        'should emit [Loading, Error] when GetDetailsMoviesEvent is added',
        build: () {
      when(mockGetGomuflixTvDetailCase.recommendationAction(testTvId))
          .thenAnswer(
              (_) async => const Left(ServerFailure('The Server is Failure')));

      return tvRecommendationBloc;
    }, act: (bloc) {
      bloc.add(GomuTvDetailEvent(testTvId));
    }, expect: () {
      return [
        GomuTvDetailLoading(),
        GomuTvDetailError('The Server is Failure')
      ];
    }, verify: (bloc) {
      verify(mockGetGomuflixTvDetailCase.recommendationAction(testTvId));

      return tvRecommendationBloc.state.props;
    });
  });
}
