import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MockGomuTvPopularBloc extends MockBloc<GomuTvListEvent, GomuTvListState>
    implements GomuTvPopularBloc {}

class MockGomuTvTopRatedBloc extends MockBloc<GomuTvListEvent, GomuTvListState>
    implements GomuTvTopRatedBloc {}

class MockGomuTvOnAirBloc extends MockBloc<GomuTvListEvent, GomuTvListState>
    implements GomuTvOnAirBloc {}

class GomuTvListEventFake extends Fake implements GomuTvListEvent {}

class GomuTvListStateFake extends Fake implements GomuTvListState {}

void main() {
  // Declarate Variable
  late MockGomuTvOnAirBloc mockGomuTvOnAirBloc;

  late MockGomuTvPopularBloc mockGomuTvPopularBloc;

  late MockGomuTvTopRatedBloc mockGomuTvTopRatedBloc;

  setUp(() {
    mockGomuTvOnAirBloc = MockGomuTvOnAirBloc();

    mockGomuTvPopularBloc = MockGomuTvPopularBloc();

    mockGomuTvTopRatedBloc = MockGomuTvTopRatedBloc();
  });

  setUpAll(() {
    registerFallbackValue(GomuTvListEventFake);
    registerFallbackValue(GomuTvListStateFake);
  });

  // Main Screen
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuTvOnAirBloc.state).thenReturn(GomuTvListLoading());

    when(() => mockGomuTvPopularBloc.state).thenReturn(GomuTvListLoading());

    when(() => mockGomuTvTopRatedBloc.state).thenReturn(GomuTvListLoading());

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvOnAirBloc>.value(value: mockGomuTvOnAirBloc),
        BlocProvider<GomuTvPopularBloc>.value(value: mockGomuTvPopularBloc),
        BlocProvider<GomuTvTopRatedBloc>.value(value: mockGomuTvTopRatedBloc)
      ],
      child: MaterialApp(
        home: GomuflixTvMainScreen(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when loaded',
      (WidgetTester tester) async {
    when(() => mockGomuTvOnAirBloc.state)
        .thenReturn(GomuTvListLoaded([testTvSeries]));

    when(() => mockGomuTvPopularBloc.state)
        .thenReturn(GomuTvListLoaded([testTvSeries]));

    when(() => mockGomuTvTopRatedBloc.state)
        .thenReturn(GomuTvListLoaded([testTvSeries]));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvOnAirBloc>.value(value: mockGomuTvOnAirBloc),
        BlocProvider<GomuTvPopularBloc>.value(value: mockGomuTvPopularBloc),
        BlocProvider<GomuTvTopRatedBloc>.value(value: mockGomuTvTopRatedBloc)
      ],
      child: MaterialApp(
        home: GomuflixTvMainScreen(),
      ),
    ));

    expect(find.byType(ListView), findsNWidgets(3));
  });

  testWidgets('Page should display center progress bar when error',
      (WidgetTester tester) async {
    when(() => mockGomuTvOnAirBloc.state).thenReturn(GomuTvListError('Error'));

    when(() => mockGomuTvPopularBloc.state)
        .thenReturn(GomuTvListError('Error'));

    when(() => mockGomuTvTopRatedBloc.state)
        .thenReturn(GomuTvListError('Error'));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvOnAirBloc>.value(value: mockGomuTvOnAirBloc),
        BlocProvider<GomuTvPopularBloc>.value(value: mockGomuTvPopularBloc),
        BlocProvider<GomuTvTopRatedBloc>.value(value: mockGomuTvTopRatedBloc)
      ],
      child: MaterialApp(
        home: GomuflixTvMainScreen(),
      ),
    ));

    expect(find.byKey(Key('error_message')), findsNWidgets(3));
  });

  // Tv Popular
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuTvPopularBloc.state).thenReturn(GomuTvListLoading());

    await tester.pumpWidget(
      BlocProvider<GomuTvPopularBloc>.value(
        value: mockGomuTvPopularBloc,
        child: MaterialApp(
          home: GomuflixTvPopularScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockGomuTvPopularBloc.state)
        .thenReturn(GomuTvListLoaded([testTvSeries]));

    await tester.pumpWidget(
      BlocProvider<GomuTvPopularBloc>.value(
        value: mockGomuTvPopularBloc,
        child: MaterialApp(
          home: GomuflixTvPopularScreen(),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockGomuTvPopularBloc.state)
        .thenReturn(GomuTvListError('Error'));

    await tester.pumpWidget(
      BlocProvider<GomuTvPopularBloc>.value(
        value: mockGomuTvPopularBloc,
        child: MaterialApp(
          home: GomuflixTvPopularScreen(),
        ),
      ),
    );

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });

  // Tv Top Rated
  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuTvTopRatedBloc.state).thenReturn(GomuTvListLoading());

    await tester.pumpWidget(
      BlocProvider<GomuTvTopRatedBloc>.value(
        value: mockGomuTvTopRatedBloc,
        child: MaterialApp(
          home: GomuflixTvTopRatedScreen(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockGomuTvTopRatedBloc.state)
        .thenReturn(GomuTvListLoaded([testTvSeries]));

    await tester.pumpWidget(
      BlocProvider<GomuTvTopRatedBloc>.value(
        value: mockGomuTvTopRatedBloc,
        child: MaterialApp(
          home: GomuflixTvTopRatedScreen(),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockGomuTvTopRatedBloc.state)
        .thenReturn(GomuTvListError('Error'));

    await tester.pumpWidget(
      BlocProvider<GomuTvTopRatedBloc>.value(
        value: mockGomuTvTopRatedBloc,
        child: MaterialApp(
          home: GomuflixTvTopRatedScreen(),
        ),
      ),
    );

    expect(find.byKey(Key('error_message')), findsOneWidget);
  });
}
