import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'gomu_movie_detail_screen_test.mocks.dart';

@GenerateMocks([GomuflixMovieDetailNotifier])
void main() {
  late MockGomuflixMovieDetailNotifier mockDetailNotifier;

  setUp(() {
    mockDetailNotifier = MockGomuflixMovieDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<GomuflixMovieDetailNotifier>.value(
      value: mockDetailNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockDetailNotifier.movieState).thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movie).thenReturn(testMovieDetail);

    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movieRecommendations)
        .thenReturn(<GomuflixMovieEntity>[]);

    when(mockDetailNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester
        .pumpWidget(_makeTestableWidget(GomuflixMovieDetailScreen(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(mockDetailNotifier.movieState).thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movie).thenReturn(testMovieDetail);

    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movieRecommendations)
        .thenReturn(<GomuflixMovieEntity>[]);

    when(mockDetailNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester
        .pumpWidget(_makeTestableWidget(GomuflixMovieDetailScreen(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockDetailNotifier.movieState).thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movie).thenReturn(testMovieDetail);

    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movieRecommendations)
        .thenReturn(<GomuflixMovieEntity>[]);

    when(mockDetailNotifier.isAddedToWatchlist).thenReturn(false);

    when(mockDetailNotifier.watchlistMessage).thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(_makeTestableWidget(GomuflixMovieDetailScreen(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);

    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockDetailNotifier.movieState).thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movie).thenReturn(testMovieDetail);

    when(mockDetailNotifier.recommendationState)
        .thenReturn(RequestState.loaded);

    when(mockDetailNotifier.movieRecommendations)
        .thenReturn(<GomuflixMovieEntity>[]);

    when(mockDetailNotifier.isAddedToWatchlist).thenReturn(false);

    when(mockDetailNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester
        .pumpWidget(_makeTestableWidget(GomuflixMovieDetailScreen(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);

    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);

    expect(find.text('Failed'), findsOneWidget);
  });
}
