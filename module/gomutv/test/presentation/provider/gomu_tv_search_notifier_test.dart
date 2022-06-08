import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gomu_tv_search_notifier_test.mocks.dart';

@GenerateMocks([SearchGomuflixTvCase])
void main() {
  late GomuflixTvSearchNotifier tvProvider;

  late MockSearchGomuflixTvCase mockSearchTv;

  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;

    mockSearchTv = MockSearchGomuflixTvCase();

    tvProvider = GomuflixTvSearchNotifier(searchTv: mockSearchTv)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTvModel = GomuflixTvEntity(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    voteAverage: 1.0,
    voteCount: 1,
    name: 'name',
  );
  final tTvList = <GomuflixTvEntity>[tTvModel];

  final tQuery = 'spiderman';

  group('search Tv', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTv.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));

      // act
      tvProvider.syncSearchTv(tQuery);

      // assert
      expect(tvProvider.searchState, RequestState.loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchTv.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));

      // act
      await tvProvider.syncSearchTv(tQuery);

      // assert
      expect(tvProvider.searchState, RequestState.loaded);

      expect(tvProvider.searchResult, tTvList);

      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTv.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));

      // act
      await tvProvider.syncSearchTv(tQuery);

      // assert
      expect(tvProvider.searchState, RequestState.error);

      expect(tvProvider.message, 'Server Failure');

      expect(listenerCallCount, 2);
    });
  });
}
