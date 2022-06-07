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

  // Popular Movie Test
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.loading);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestWidget(GomuflixMoviePopularScreen()));

    expect(progressBarFinder, findsOneWidget);
  });

  // testWidgets('Page should display ListView when data is loaded',
  //     (WidgetTester tester) async {
  //   when(mockMovieListNotifier.state).thenReturn(RequestState.loaded);

  //   final listViewFinder = find.byType(ListView);

  //   await tester.pumpWidget(_makeTestWidget(GomuflixMoviePopularScreen()));

  //   expect(listViewFinder, findsOneWidget);
  // });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.error);

    when(mockMovieListNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestWidget(GomuflixMoviePopularScreen()));

    expect(textFinder, findsOneWidget);
  });

  // Top Rated Movie Test
  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.loading);

    final progressFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestWidget(GomuflixMovieTopRatedScreen()));

    expect(progressFinder, findsOneWidget);
  });

  // testWidgets('Page should display when data is loaded',
  //     (WidgetTester tester) async {
  //   when(mockMovieListNotifier.state).thenReturn(RequestState.loaded);

  //   when(mockMovieListNotifier.gomuMovie).thenReturn(<GomuflixMovieEntity>[]);

  //   final listViewFinder = find.byType(ListView);

  //   await tester
  //       .pumpWidget(_makeTestableTopRatedWidget(GomuflixMovieTopRatedScreen()));

  //   expect(listViewFinder, findsOneWidget);
  // });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockMovieListNotifier.state).thenReturn(RequestState.error);

    when(mockMovieListNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestWidget(GomuflixMovieTopRatedScreen()));

    expect(textFinder, findsOneWidget);
  });
}
