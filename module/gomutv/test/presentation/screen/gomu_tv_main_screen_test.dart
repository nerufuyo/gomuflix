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

  // Tv Popular
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvPopularScreen()));

    expect(progressBarFinder, findsOneWidget);
  });

  // testWidgets('Page should display ListView when data is loaded',
  //     (WidgetTester tester) async {
  //   when(mockTvListNotifier.state).thenReturn(RequestState.loaded);

  //   when(mockTvListNotifier.tv).thenReturn(<GomuflixTvEntity>[]);

  //   final listViewFinder = find.byType(ListView);

  //   await tester.pumpWidget(_makeTestWidget(GomuflixTvPopularScreen()));

  //   expect(listViewFinder, findsOneWidget);
  // });

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

    final progressFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestWidget(GomuflixTvTopRatedScreen()));

    expect(progressFinder, findsOneWidget);
  });

  // testWidgets('Page should display when data is loaded',
  //     (WidgetTester tester) async {
  //   when(mockTvListNotifier.state).thenReturn(RequestState.loaded);

  //   when(mockTvListNotifier.tv).thenReturn(<GomuflixTvEntity>[]);

  //   final listViewFinder = find.byType(ListView);

  //   await tester.pumpWidget(_makeTestWidget(GomuflixTvTopRatedScreen()));

  //   expect(listViewFinder, findsOneWidget);
  // });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockTvListNotifier.state).thenReturn(RequestState.error);

    when(mockTvListNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestWidget(GomuflixTvTopRatedScreen()));

    expect(textFinder, findsOneWidget);
  });
}
