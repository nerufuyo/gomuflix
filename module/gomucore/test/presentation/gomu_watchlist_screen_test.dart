import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mocktail/mocktail.dart';

import '../dummy_data/dummy_objects.dart';

class MockGomuTvWatchlistBloc
    extends MockBloc<GomuTvWatchlistEvent, GomuTvWatchlistState>
    implements GomuTvWatchlistBloc {}

class MockGomuMovieWatchlistBloc
    extends MockBloc<GomuMovieWatchlistEvent, GomuMovieWatchlistState>
    implements GomuMovieWatchlistBloc {}

class GomuTvWatchlistEventFake extends Fake implements GomuTvWatchlistEvent {}

class GomuTvWatchlistStateFake extends Fake implements GomuTvWatchlistState {}

class GomuMovieWatchlistEventFake extends Fake
    implements GomuMovieWatchlistEvent {}

class GomuMovieWatchlistStateFake extends Fake
    implements GomuMovieWatchlistState {}

void main() {
  late MockGomuTvWatchlistBloc mockGomuTvWatchlistBloc;

  late MockGomuMovieWatchlistBloc mockGomuMovieWatchlistBloc;

  setUp(() {
    mockGomuTvWatchlistBloc = MockGomuTvWatchlistBloc();

    mockGomuMovieWatchlistBloc = MockGomuMovieWatchlistBloc();
  });

  setUpAll(() {
    registerFallbackValue(GomuTvWatchlistEventFake);

    registerFallbackValue(GomuTvWatchlistStateFake);

    registerFallbackValue(GomuMovieWatchlistEventFake);

    registerFallbackValue(GomuMovieWatchlistStateFake);
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuTvWatchlistBloc.state)
        .thenReturn(GomuTvWatchlistLoading());

    when(() => mockGomuMovieWatchlistBloc.state)
        .thenReturn(GomuMovieWatchlistLoading());

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvWatchlistBloc>.value(value: mockGomuTvWatchlistBloc),
        BlocProvider<GomuMovieWatchlistBloc>.value(
            value: mockGomuMovieWatchlistBloc),
      ],
      child: MaterialApp(
        home: GomuflixWatchlistScreen(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
  });

  testWidgets('Page should display center progress bar when loaded',
      (WidgetTester tester) async {
    when(() => mockGomuTvWatchlistBloc.state)
        .thenReturn(GomuTvWatchlistLoaded([testTvSeries]));

    when(() => mockGomuMovieWatchlistBloc.state)
        .thenReturn(GomuMovieWatchlistLoaded([testMovie]));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvWatchlistBloc>.value(value: mockGomuTvWatchlistBloc),
        BlocProvider<GomuMovieWatchlistBloc>.value(
            value: mockGomuMovieWatchlistBloc),
      ],
      child: MaterialApp(
        home: GomuflixWatchlistScreen(),
      ),
    ));

    expect(find.byType(ListView), findsNWidgets(2));
  });

  testWidgets('Page should display center progress bar when error',
      (WidgetTester tester) async {
    when(() => mockGomuTvWatchlistBloc.state)
        .thenReturn(GomuTvWatchlistError('Error'));

    when(() => mockGomuMovieWatchlistBloc.state)
        .thenReturn(GomuMovieWatchlistError('Error'));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvWatchlistBloc>.value(value: mockGomuTvWatchlistBloc),
        BlocProvider<GomuMovieWatchlistBloc>.value(
            value: mockGomuMovieWatchlistBloc),
      ],
      child: MaterialApp(
        home: GomuflixWatchlistScreen(),
      ),
    ));

    expect(find.byKey(Key('error_message')), findsNWidgets(2));
  });
}
