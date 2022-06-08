import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'gomu_movie_main_screen_test.mocks.dart';

@GenerateMocks([GomuflixMovieListNotifier])
void main() {
  late MockGomuflixMovieListNotifier mockMovieListNotifier;

  setUp(() {
    mockMovieListNotifier = MockGomuflixMovieListNotifier();
  });

  // Find Widget
  Widget _makeTestWidget(Widget body) {
    return ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
      value: mockMovieListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  // Main Screen
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.gomuMovieNowPlayingState)
        .thenReturn(RequestState.loading);

    when(mockMovieListNotifier.gomuMoviePopularState)
        .thenReturn(RequestState.loading);

    when(mockMovieListNotifier.gomuMovieTopRatedState)
        .thenReturn(RequestState.loading);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
            value: mockMovieListNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixMovieMainScreen(),
        )));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.gomuMovieNowPlayingState)
        .thenReturn(RequestState.loaded);

    when(mockMovieListNotifier.gomuMoviePopularState)
        .thenReturn(RequestState.loaded);

    when(mockMovieListNotifier.gomuMovieTopRatedState)
        .thenReturn(RequestState.loaded);

    when(mockMovieListNotifier.nowPlayingMovies)
        .thenReturn(<GomuflixMovieEntity>[]);

    when(mockMovieListNotifier.popularMovies)
        .thenReturn(<GomuflixMovieEntity>[]);

    when(mockMovieListNotifier.topRatedMovies)
        .thenReturn(<GomuflixMovieEntity>[]);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
            value: mockMovieListNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixMovieMainScreen(),
        )));

    expect(find.byType(ListView), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.gomuMovieNowPlayingState)
        .thenReturn(RequestState.error);

    when(mockMovieListNotifier.gomuMoviePopularState)
        .thenReturn(RequestState.error);

    when(mockMovieListNotifier.gomuMovieTopRatedState)
        .thenReturn(RequestState.error);

    when(mockMovieListNotifier.message).thenReturn('Error message');

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
            value: mockMovieListNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixMovieMainScreen(),
        )));

    expect(find.byKey(Key('error_message')), findsNWidgets(3));
  });

  // Popular Movie Test
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.loading);

    await tester.pumpWidget(_makeTestWidget(GomuflixMoviePopularScreen()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.loaded);

    when(mockMovieListNotifier.popularMovies)
        .thenReturn(<GomuflixMovieEntity>[]);

    await tester.pumpWidget(_makeTestWidget(GomuflixMoviePopularScreen()));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.error);

    when(mockMovieListNotifier.message).thenReturn('Error message');

    await tester.pumpWidget(_makeTestWidget(GomuflixMoviePopularScreen()));

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });

  // Top Rated Movie Test
  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.loading);

    await tester.pumpWidget(_makeTestWidget(GomuflixMovieTopRatedScreen()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.loaded);

    when(mockMovieListNotifier.topRatedMovies)
        .thenReturn(<GomuflixMovieEntity>[]);

    await tester.pumpWidget(_makeTestWidget(GomuflixMovieTopRatedScreen()));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.error);

    when(mockMovieListNotifier.message).thenReturn('Error message');

    await tester.pumpWidget(_makeTestWidget(GomuflixMovieTopRatedScreen()));

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });
}
