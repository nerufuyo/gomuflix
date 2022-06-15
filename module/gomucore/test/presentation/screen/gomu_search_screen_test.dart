import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MocksGomuTvSearchBloc
    extends MockBloc<GomuTvSearchEvent, GomuTvSearchState>
    implements GomuTvSearchBloc {}

class MocksGomuMovieSearchBloc
    extends MockBloc<GomuMovieSearchEvent, GomuMovieSearchState>
    implements GomuMovieSearchBloc {}

class GomuTvSearchEventFake extends Fake implements GomuTvSearchEvent {}

class GomuTvSearchStateFake extends Fake implements GomuTvSearchState {}

class GomuMovieSearchEventFake extends Fake implements GomuMovieSearchEvent {}

class GomuMovieSearchStateFake extends Fake implements GomuMovieSearchState {}

void main() {
  // Declarate Variables
  late MocksGomuTvSearchBloc mockGomuTvSearchBloc;

  late MocksGomuMovieSearchBloc mockGomuMovieSearchBloc;

  setUp(() {
    mockGomuTvSearchBloc = MocksGomuTvSearchBloc();

    mockGomuMovieSearchBloc = MocksGomuMovieSearchBloc();
  });

  setUpAll(() {
    registerFallbackValue(GomuTvSearchEventFake);

    registerFallbackValue(GomuTvSearchStateFake);

    registerFallbackValue(GomuMovieSearchEventFake);

    registerFallbackValue(GomuMovieSearchStateFake);
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGomuTvSearchBloc.state).thenReturn(GomuTvSearchLoading());

    when(() => mockGomuMovieSearchBloc.state)
        .thenReturn(GomuMovieSearchLoading());

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvSearchBloc>.value(value: mockGomuTvSearchBloc),
        BlocProvider<GomuMovieSearchBloc>.value(value: mockGomuMovieSearchBloc),
      ],
      child: MaterialApp(
        home: GomuflixSearchScreen(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsNWidgets(2));
  });

  testWidgets('Page should display center progress bar when loaded',
      (WidgetTester tester) async {
    when(() => mockGomuTvSearchBloc.state)
        .thenReturn(GomuTvSearchLoaded([testTvSeries]));

    when(() => mockGomuMovieSearchBloc.state)
        .thenReturn(GomuMovieSearchLoaded([testMovie]));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvSearchBloc>.value(value: mockGomuTvSearchBloc),
        BlocProvider<GomuMovieSearchBloc>.value(value: mockGomuMovieSearchBloc),
      ],
      child: MaterialApp(
        home: GomuflixSearchScreen(),
      ),
    ));

    expect(find.byType(ListView), findsNWidgets(2));
  });

  testWidgets('Page should display center progress bar when error',
      (WidgetTester tester) async {
    when(() => mockGomuTvSearchBloc.state)
        .thenReturn(GomuTvSearchError('Error'));

    when(() => mockGomuMovieSearchBloc.state)
        .thenReturn(GomuMovieSearchError('Error'));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvSearchBloc>.value(value: mockGomuTvSearchBloc),
        BlocProvider<GomuMovieSearchBloc>.value(value: mockGomuMovieSearchBloc),
      ],
      child: MaterialApp(
        home: GomuflixSearchScreen(),
      ),
    ));

    expect(find.byKey(Key('error_message')), findsNWidgets(2));
  });

  testWidgets('Page should display when initial', (WidgetTester tester) async {
    when(() => mockGomuTvSearchBloc.state).thenReturn(GomuTvSearchInitial(''));

    when(() => mockGomuMovieSearchBloc.state)
        .thenReturn(GomuMovieSearchInitial(''));

    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<GomuTvSearchBloc>.value(value: mockGomuTvSearchBloc),
        BlocProvider<GomuMovieSearchBloc>.value(value: mockGomuMovieSearchBloc),
      ],
      child: MaterialApp(
        home: GomuflixSearchScreen(),
      ),
    ));

    expect(find.byKey(Key('initial_message')), findsNWidgets(2));
  });
}
