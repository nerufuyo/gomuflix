import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_movie_detail_bloc_test.mocks.dart';

@GenerateMocks([GetGomuflixMovieDetailCase])
const id = 1;

void main() {
  // Declarate Variables
  late GomuMovieDetailBloc gomuMovieDetailBloc;

  late GomuMovieRecommendationBloc gomuMovieRecommendationBloc;

  late MockGetGomuflixMovieDetailCase mockGetGomuMovieDetailCase;

  const testMovieId = 1;

  setUp(() {
    mockGetGomuMovieDetailCase = MockGetGomuflixMovieDetailCase();

    gomuMovieDetailBloc = GomuMovieDetailBloc(mockGetGomuMovieDetailCase);

    gomuMovieRecommendationBloc =
        GomuMovieRecommendationBloc(mockGetGomuMovieDetailCase);
  });

  group('Movie Detail', () {
    test('the initial state should be MoviesDetailsEmpty', () {
      expect(gomuMovieDetailBloc.state, GomuMovieDetailInitial());
    });

    blocTest<GomuMovieDetailBloc, GomuMovieDetailState>(
        'should emit [Loading, Loaded] when GetDetailsTvsEvent is added',
        build: () {
      when(mockGetGomuMovieDetailCase.detailAction(testMovieId))
          .thenAnswer((_) async => Right(testMovieDetail));

      return gomuMovieDetailBloc;
    }, act: (bloc) {
      bloc.add(GomuMovieDetailEvent(testMovieId));
    }, expect: () {
      return [
        GomuMovieDetailLoading(),
        GomuMovieDetailLoaded(testMovieDetail),
      ];
    }, verify: (bloc) {
      verify(mockGetGomuMovieDetailCase.detailAction(testMovieId));

      return gomuMovieDetailBloc.state.props;
    });

    blocTest<GomuMovieDetailBloc, GomuMovieDetailState>(
        'should emit [Loading, Error] when GetDetailsMoviesEvent is added',
        build: () {
      when(mockGetGomuMovieDetailCase.detailAction(testMovieId)).thenAnswer(
          (_) async => const Left(ServerFailure('The Server is Failure')));

      return gomuMovieDetailBloc;
    }, act: (bloc) {
      bloc.add(GomuMovieDetailEvent(testMovieId));
    }, expect: () {
      return [
        GomuMovieDetailLoading(),
        GomuMovieDetailError('The Server is Failure')
      ];
    }, verify: (bloc) {
      verify(mockGetGomuMovieDetailCase.detailAction(testMovieId));

      return gomuMovieDetailBloc.state.props;
    });
  });

  group('Movie Recommendation', () {
    test('the initial state should be MoviesDetailsEmpty', () {
      expect(gomuMovieRecommendationBloc.state, GomuMovieDetailInitial());
    });

    blocTest<GomuMovieRecommendationBloc, GomuMovieDetailState>(
        'should emit [Loading, Loaded] when GetDetailsTvsEvent is added',
        build: () {
      when(mockGetGomuMovieDetailCase.recommendationAction(testMovieId))
          .thenAnswer((_) async => Right(testMovieList));

      return gomuMovieRecommendationBloc;
    }, act: (bloc) {
      bloc.add(GomuMovieDetailEvent(testMovieId));
    }, expect: () {
      return [
        GomuMovieDetailLoading(),
        GomuMovieRecommendationLoaded(testMovieList)
      ];
    }, verify: (bloc) {
      verify(mockGetGomuMovieDetailCase.recommendationAction(testMovieId));

      return gomuMovieDetailBloc.state.props;
    });

    blocTest<GomuMovieRecommendationBloc, GomuMovieDetailState>(
        'should emit [Loading, Error] when GetDetailsMoviesEvent is added',
        build: () {
      when(mockGetGomuMovieDetailCase.recommendationAction(testMovieId))
          .thenAnswer(
              (_) async => const Left(ServerFailure('The Server is Failure')));

      return gomuMovieRecommendationBloc;
    }, act: (bloc) {
      bloc.add(GomuMovieDetailEvent(testMovieId));
    }, expect: () {
      return [
        GomuMovieDetailLoading(),
        GomuMovieDetailError('The Server is Failure')
      ];
    }, verify: (bloc) {
      verify(mockGetGomuMovieDetailCase.recommendationAction(testMovieId));

      return gomuMovieDetailBloc.state.props;
    });
  });
}
