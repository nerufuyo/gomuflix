import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'gomu_watchlist_screen_test.mocks.dart';

@GenerateMocks([GomuTvWatchlistBloc, GomuflixMovieListNotifier])
void main() {
  late MockGomuflixMovieListNotifier mockMovieListNotifier;

  late MockGomuTvWatchlistBloc mockWatchlistBloc;

  setUp(() {
    mockMovieListNotifier = MockGomuflixMovieListNotifier();

    mockWatchlistBloc = MockGomuTvWatchlistBloc();
  });

  // Loading
  // testWidgets('Page should display center progress bar when loading',
  //     (WidgetTester tester) async {
  //   when(mockWatchlistBloc.state).thenReturn(GomuTvWatchlistLoading());

  //   when(mockMovieListNotifier.state).thenReturn(RequestState.loading);

  //   await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
  //           value: mockMovieListNotifier,
  //         ),
  //       ],
  //       child: MaterialApp(
  //         home: GomuflixWatchlistScreen(),
  //       )));

  //   expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
  // });

  // testWidgets('Page should display  when error', (WidgetTester tester) async {
  //   when(mockTvListNotifier.state).thenReturn(RequestState.loaded);

  //   when(mockMovieListNotifier.state).thenReturn(RequestState.loaded);

  //   when(mockTvListNotifier.watchlistTv).thenReturn(<GomuflixTvEntity>[]);

  //   when(mockMovieListNotifier.watchlistMovies)
  //       .thenReturn(<GomuflixMovieEntity>[]);

  //   await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
  //           value: mockMovieListNotifier,
  //         ),
  //         ChangeNotifierProvider<GomuflixTvListNotifier>.value(
  //           value: mockTvListNotifier,
  //         ),
  //       ],
  //       child: MaterialApp(
  //         home: GomuflixWatchlistScreen(),
  //       )));

  //   expect(find.byType(ListView), findsNWidgets(2));
  // });

  // testWidgets('Page should display  when error', (WidgetTester tester) async {
  //   when(mockTvListNotifier.state).thenReturn(RequestState.error);

  //   when(mockMovieListNotifier.state).thenReturn(RequestState.error);

  //   when(mockTvListNotifier.message).thenReturn('Error message');

  //   when(mockMovieListNotifier.message).thenReturn('Error message');

  //   await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<GomuflixMovieListNotifier>.value(
  //           value: mockMovieListNotifier,
  //         ),
  //         ChangeNotifierProvider<GomuflixTvListNotifier>.value(
  //           value: mockTvListNotifier,
  //         ),
  //       ],
  //       child: MaterialApp(
  //         home: GomuflixWatchlistScreen(),
  //       )));

  //   expect(find.byKey(Key('error_message')), findsNWidgets(2));
  // });
}
