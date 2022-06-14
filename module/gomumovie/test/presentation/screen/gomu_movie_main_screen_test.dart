import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MockGomuMovieNowPlayingBloc
    extends MockBloc<GomuMovieListEvent, GomuMovieListState>
    implements GomuMovieNowPlayingBloc {}

class MockGomuMoviePopularBloc
    extends MockBloc<GomuMovieListEvent, GomuMovieListState>
    implements GomuMoviePopularBloc {}

class MockGomuMovieTopRatedBloc
    extends MockBloc<GomuMovieListEvent, GomuMovieListState>
    implements GomuMovieTopRatedBloc {}

class GomuMovieListEventFake extends Fake implements GomuMovieListEvent {}

class GomuMovieListStateFake extends Fake implements GomuMovieListState {}

void main() {
  // Declarate Variables
  late MockGomuMovieNowPlayingBloc mockGomuMovieNowPlayingBloc;

  late MockGomuMoviePopularBloc mockGomuMoviePopularBloc;

  late MockGomuMovieTopRatedBloc mockGomuMovieTopRatedBloc;

  setUp(() {
    mockGomuMovieNowPlayingBloc = MockGomuMovieNowPlayingBloc();

    mockGomuMoviePopularBloc = MockGomuMoviePopularBloc();

    mockGomuMovieTopRatedBloc = MockGomuMovieTopRatedBloc();
  });

  setUpAll(() {
    registerFallbackValue(GomuMovieListStateFake);

    registerFallbackValue(GomuMovieListEventFake());
  });

  // Main Screen
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuMovieNowPlayingBloc.state)
        .thenReturn(GomuMovieListLoading());

    when(() => mockGomuMoviePopularBloc.state)
        .thenReturn(GomuMovieListLoading());

    when(() => mockGomuMovieTopRatedBloc.state)
        .thenReturn(GomuMovieListLoading());

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuMovieNowPlayingBloc>.value(
            value: mockGomuMovieNowPlayingBloc),
        BlocProvider<GomuMoviePopularBloc>.value(
            value: mockGomuMoviePopularBloc),
        BlocProvider<GomuMovieTopRatedBloc>.value(
            value: mockGomuMovieTopRatedBloc)
      ],
      child: MaterialApp(
        home: GomuflixMovieMainScreen(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when loaded',
      (WidgetTester tester) async {
    when(() => mockGomuMovieNowPlayingBloc.state)
        .thenReturn(GomuMovieListLoaded([testMovie]));

    when(() => mockGomuMoviePopularBloc.state)
        .thenReturn(GomuMovieListLoaded([testMovie]));

    when(() => mockGomuMovieTopRatedBloc.state)
        .thenReturn(GomuMovieListLoaded([testMovie]));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuMovieNowPlayingBloc>.value(
            value: mockGomuMovieNowPlayingBloc),
        BlocProvider<GomuMoviePopularBloc>.value(
            value: mockGomuMoviePopularBloc),
        BlocProvider<GomuMovieTopRatedBloc>.value(
            value: mockGomuMovieTopRatedBloc)
      ],
      child: MaterialApp(
        home: GomuflixMovieMainScreen(),
      ),
    ));

    expect(find.byType(ListView), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when error',
      (WidgetTester tester) async {
    when(() => mockGomuMovieNowPlayingBloc.state)
        .thenReturn(GomuMovieListError('Error'));

    when(() => mockGomuMoviePopularBloc.state)
        .thenReturn(GomuMovieListError('Error'));

    when(() => mockGomuMovieTopRatedBloc.state)
        .thenReturn(GomuMovieListError('Error'));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuMovieNowPlayingBloc>.value(
            value: mockGomuMovieNowPlayingBloc),
        BlocProvider<GomuMoviePopularBloc>.value(
            value: mockGomuMoviePopularBloc),
        BlocProvider<GomuMovieTopRatedBloc>.value(
            value: mockGomuMovieTopRatedBloc)
      ],
      child: MaterialApp(
        home: GomuflixMovieMainScreen(),
      ),
    ));

    expect(find.byKey(Key('error_message')), findsNWidgets(3));
  });

  // Movie Popular
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuMoviePopularBloc.state)
        .thenReturn(GomuMovieListLoading());

    await tester.pumpWidget(
      BlocProvider<GomuMoviePopularBloc>.value(
        value: mockGomuMoviePopularBloc,
        child: MaterialApp(
          home: GomuflixMoviePopularScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockGomuMoviePopularBloc.state)
        .thenReturn(GomuMovieListLoaded([testMovie]));

    await tester.pumpWidget(
      BlocProvider<GomuMoviePopularBloc>.value(
        value: mockGomuMoviePopularBloc,
        child: MaterialApp(
          home: GomuflixMoviePopularScreen(),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockGomuMoviePopularBloc.state)
        .thenReturn(GomuMovieListError('Error'));

    await tester.pumpWidget(
      BlocProvider<GomuMoviePopularBloc>.value(
        value: mockGomuMoviePopularBloc,
        child: MaterialApp(
          home: GomuflixMoviePopularScreen(),
        ),
      ),
    );

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });

  // Movie Top Rated
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuMovieTopRatedBloc.state)
        .thenReturn(GomuMovieListLoading());

    await tester.pumpWidget(
      BlocProvider<GomuMovieTopRatedBloc>.value(
        value: mockGomuMovieTopRatedBloc,
        child: MaterialApp(
          home: GomuflixMovieTopRatedScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockGomuMovieTopRatedBloc.state)
        .thenReturn(GomuMovieListLoaded([testMovie]));

    await tester.pumpWidget(
      BlocProvider<GomuMovieTopRatedBloc>.value(
        value: mockGomuMovieTopRatedBloc,
        child: MaterialApp(
          home: GomuflixMovieTopRatedScreen(),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockGomuMovieTopRatedBloc.state)
        .thenReturn(GomuMovieListError('Error'));

    await tester.pumpWidget(
      BlocProvider<GomuMovieTopRatedBloc>.value(
        value: mockGomuMovieTopRatedBloc,
        child: MaterialApp(
          home: GomuflixMovieTopRatedScreen(),
        ),
      ),
    );

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });
}
