import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'gomu_tv_main_screen_test.mocks.dart';

@GenerateMocks([GomuflixTvListNotifier])
void main() {
  late MockGomuflixTvListNotifier mockTvListNotifier;

  setUp(() {
    mockTvListNotifier = MockGomuflixTvListNotifier();
  });

  Widget _makeTestWidget(Widget body) {
    return ChangeNotifierProvider<GomuflixTvListNotifier>.value(
      value: mockTvListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  // Main Screen
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockTvListNotifier.gomuTvOnAirState).thenReturn(RequestState.loading);

    when(mockTvListNotifier.gomuTvPopularState)
        .thenReturn(RequestState.loading);

    when(mockTvListNotifier.gomuTvTopRatedState)
        .thenReturn(RequestState.loading);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixTvListNotifier>.value(
            value: mockTvListNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixTvMainScreen(),
        )));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when loaded',
      (WidgetTester tester) async {
    when(mockTvListNotifier.gomuTvOnAirState).thenReturn(RequestState.loaded);

    when(mockTvListNotifier.gomuTvPopularState).thenReturn(RequestState.loaded);

    when(mockTvListNotifier.gomuTvTopRatedState)
        .thenReturn(RequestState.loaded);

    when(mockTvListNotifier.onAirTv).thenReturn(<GomuflixTvEntity>[]);

    when(mockTvListNotifier.popularTv).thenReturn(<GomuflixTvEntity>[]);

    when(mockTvListNotifier.topRatedTv).thenReturn(<GomuflixTvEntity>[]);

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixTvListNotifier>.value(
            value: mockTvListNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixTvMainScreen(),
        )));

    expect(find.byType(ListView), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when error',
      (WidgetTester tester) async {
    when(mockTvListNotifier.gomuTvOnAirState).thenReturn(RequestState.error);

    when(mockTvListNotifier.gomuTvPopularState).thenReturn(RequestState.error);

    when(mockTvListNotifier.gomuTvTopRatedState).thenReturn(RequestState.error);

    when(mockTvListNotifier.message).thenReturn('Error message');

    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<GomuflixTvListNotifier>.value(
            value: mockTvListNotifier,
          ),
        ],
        child: MaterialApp(
          home: GomuflixTvMainScreen(),
        )));

    expect(find.byKey(Key('error_message')), findsNWidgets(3));
  });

  // Tv Popular
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.loading);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvPopularScreen()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.loaded);

    when(mockTvListNotifier.popularTv).thenReturn(<GomuflixTvEntity>[]);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvPopularScreen()));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.error);

    when(mockTvListNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestWidget(GomuflixTvPopularScreen()));

    expect(textFinder, findsOneWidget);
  });

  // Tv Top Rated
  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.loading);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvTopRatedScreen()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.loaded);

    when(mockTvListNotifier.topRatedTv).thenReturn(<GomuflixTvEntity>[]);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvTopRatedScreen()));

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.error);

    when(mockTvListNotifier.message).thenReturn('Error message');

    await tester.pumpWidget(_makeTestWidget(GomuflixTvTopRatedScreen()));

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });
}
