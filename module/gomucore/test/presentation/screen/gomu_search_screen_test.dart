import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'gomu_search_screen_test.mocks.dart';

@GenerateMocks([GomuflixTvSearchNotifier, GomuflixMovieSearchNotifier])
void main() {
  late MockGomuflixMovieSearchNotifier mockMovieSearchNotifier;

  late MockGomuflixTvSearchNotifier mockTvSearchNotifier;

  setUp(() {
    mockMovieSearchNotifier = MockGomuflixMovieSearchNotifier();

    mockTvSearchNotifier = MockGomuflixTvSearchNotifier();
  });

  // // Loading
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieSearchNotifier.state).thenReturn(RequestState.loading);

    when(mockTvSearchNotifier.stateVar).thenReturn(RequestState.loading);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixMovieSearchNotifier>.value(
            value: mockMovieSearchNotifier,
          ),
          ChangeNotifierProvider<GomuflixTvSearchNotifier>.value(
            value: mockTvSearchNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixSearchScreen(),
        )));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
  });

  // Loaded
  testWidgets('Page should display  when loaded', (WidgetTester tester) async {
    when(mockTvSearchNotifier.stateVar).thenReturn(RequestState.loaded);

    when(mockMovieSearchNotifier.state).thenReturn(RequestState.loaded);

    when(mockTvSearchNotifier.searchResult).thenReturn(<GomuflixTvEntity>[]);

    when(mockMovieSearchNotifier.searchResult)
        .thenReturn(<GomuflixMovieEntity>[]);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixTvSearchNotifier>.value(
            value: mockTvSearchNotifier,
          ),
          ChangeNotifierProvider<GomuflixMovieSearchNotifier>.value(
            value: mockMovieSearchNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixSearchScreen(),
        )));

    expect(find.byType(ListView), findsNWidgets(2));
  });

  // Error
}
