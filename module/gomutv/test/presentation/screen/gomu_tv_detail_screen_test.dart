import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_tv_detail_screen_test.mocks.dart';

@GenerateMocks([GomuflixTvDetailNotifier])
void main() {
  late MockGomuflixTvDetailNotifier mockTvDetailNotifier;

  setUp(() {
    mockTvDetailNotifier = MockGomuflixTvDetailNotifier();
  });

  Widget _makeTestWidget(Widget body) {
    return ChangeNotifierProvider<GomuflixTvDetailNotifier>.value(
      value: mockTvDetailNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when TV Series not added to watchlist',
      (WidgetTester tester) async {
    when(mockTvDetailNotifier.tvState).thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tv).thenReturn(testTvSeriesDetail);

    when(mockTvDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tvRecommendations)
        .thenReturn(<GomuflixTvEntity>[]);

    when(mockTvDetailNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvDetailScreen(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when TV Series is added to wathclist',
      (WidgetTester tester) async {
    when(mockTvDetailNotifier.tvState).thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tv).thenReturn(testTvSeriesDetail);

    when(mockTvDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tvRecommendations)
        .thenReturn(<GomuflixTvEntity>[]);

    when(mockTvDetailNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvDetailScreen(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockTvDetailNotifier.tvState).thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tv).thenReturn(testTvSeriesDetail);

    when(mockTvDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tvRecommendations)
        .thenReturn(<GomuflixTvEntity>[]);

    when(mockTvDetailNotifier.isAddedToWatchlist).thenReturn(false);

    when(mockTvDetailNotifier.watchlistMessage)
        .thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvDetailScreen(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);

    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);

    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockTvDetailNotifier.tvState).thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tv).thenReturn(testTvSeriesDetail);

    when(mockTvDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockTvDetailNotifier.tvRecommendations)
        .thenReturn(<GomuflixTvEntity>[]);

    when(mockTvDetailNotifier.isAddedToWatchlist).thenReturn(false);

    when(mockTvDetailNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvDetailScreen(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);

    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);

    expect(find.text('Failed'), findsOneWidget);
  });
}
